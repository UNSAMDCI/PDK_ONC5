# ***********************************************
# UNSAM - Universidad Nacional San Martin - 2017
# ***********************************************
#   Escuela de Ciencia y Tecnologia 
#   PDK ONC5 para materias de diseno de ICs
#      
#       :ssssssssssoo+/-`   `-/+osssssssssss:       
#       oMMMMMMMMMMMMMMMMmymMMMMMMMMMMMMMMMMo       
#       oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo       
#       oMMMMMd++++oosyhmMMMmhysoo++++dMMMMMo       
#       oMMMMMy          .+.          sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMs                       sMMMMMo       
#       oMMMMMmyyyysso+:.   .:+ossyyyymMMMMMo       
#       oMMMMMMMMMMMMMMMMmymMMMMMMMMMMMMMMMMo       
#       oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo       
#       -//////////++oshmMMMmhsoo+//////////-       
#                        `/`                                                                
# ***********************************************

__version__ = "Chuck Norris"
__author__ = "lucho"

import math

from cni.dlo import *
from cni.geo import *
from cni.constants import *
from cni.integ.common import *

from power_transistor_unit     import *
from power_transistor20_unit import *

class power_transistor(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
        tech        = Tech.get('c5')
        model       = 'lpdm20dt'

        # now use these default parameter values in the parameter definitions
        specs('model', model, 'MOSFET type', ChoiceConstraint(['lndm12dt', 'lndm12t','lpdm12dt','lpdm12t','lndm20dt','lndm20d','lpdm20dt','lpdm20d']))

        specs('mosW', 5.0, 'Device w')
        specs('mosL', 5.0, 'Device l')

        specs('fingers',1,'Device number of fingers')
        specs('mosGateContact','TOP','Device gatePad', ChoiceConstraint(['TOP', 'BOT']))
    
    def setupParams(self, params):
    #--------------------------------------------------------------------------------------------
    #
    # CONSTRUCTOR, SE ENCARGA DE QUE EL RESTO DE LAS CLASES VEAN LOS MISMOS PARAMETROS
    #
    #--------------------------------------------------------------------------------------------
    
        self.model      = params['model']

        self.w          = params['mosW']
        self.l          = params['mosL']
        self.fingers    = params['fingers']
        self.gatePad    = params['mosGateContact']

        self.baseName        = self.model
        self.transistorStack = Grouping('transistorStack')
        self.unitParams      = ParamArray()
        self.Units           = []

        self.metLayer  = Layer('M1')

        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)

        
    def genToplogy(self):

        self.addTerm('S', TermType.INPUT_OUTPUT)    # source terminal
        self.addTerm('D', TermType.INPUT_OUTPUT)    # drain terminal
        self.addTerm('G', TermType.INPUT)           # gate terminal
        self.addTerm('B', TermType.INPUT_OUTPUT)    # bulk (substrate) terminal

        self.setTermOrder(['D', 'G', 'S', 'B'])

        for i in range(self.fingers):
            sourceContact = self.Units[i].findInstPin("S").getBBox(self.metLayer)
            drainContact  = self.Units[i].findInstPin("D").getBBox(self.metLayer)
            gateContact   = self.Units[i].findInstPin("G").getBBox(self.metLayer)
            self.addPin('S'+str(i), 'S', sourceContact, self.metLayer)
            self.addPin('D'+str(i), 'D', drainContact, self.metLayer)
            self.addPin('G'+str(i), 'G', gateContact, self.metLayer)

    def sizeDevices(self):
        # code to size different devices
        if 'n' in self.model:
            mosModel = 'nMOS'
        else:
            mosModel = 'pMOS'

        if 'dt' in self.model:
            sourceContact = True
        else:
            sourceContact = False

        wf = self.w / self.fingers

        if '12' in self.model: 
            transistorUnit = 'power_transistor_unit'
            self.unitParams = ParamArray( model = mosModel,
                                        name = self.model,
                                        mosW = wf,
                                        mosL = self.l,
                                        mosGateContact = self.gatePad,
                                        mosSourceContact = sourceContact,
                                        mosDrainContact = True                                    
                                        )
        else:
            transistorUnit = 'power_transistor20_unit'
            self.unitParams = ParamArray( model = mosModel,
                                        name = self.model,
                                        mosW = wf,
                                        mosL = self.l,
                                        mosSourceContact = sourceContact,
                                        mosDrainContact = True,
                                        fingerPadSource = False,
                                        fingerPadDrain = False
                                        )
    #--------------------------------------------------------------------------------------------
    #
    # INSTANCIACION DE LOS COMPONENTES
    #
    #--------------------------------------------------------------------------------------------
        if (self.fingers is not 1) and ('n' not in self.model):
            for i in range(self.fingers):
                if i == 0:
                    self.unitParams.set(fingerPadSource = False)
                    self.unitParams.set(fingerPadDrain = True)
                elif i == self.fingers-1:
                    self.unitParams.set(fingerPadSource = True)
                    self.unitParams.set(fingerPadDrain = False)
                else:
                    self.unitParams.set(fingerPadSource = True)
                    self.unitParams.set(fingerPadDrain = True)

                name = self.baseName + str(i)
                self.Units.append(Instance(transistorUnit, self.unitParams, ['D', 'G', 'S', 'B'], name))
                self.transistorStack.add(self.Units[i])
        else:
            for i in range(self.fingers):
                name = self.baseName + str(i)
                self.Units.append(Instance(transistorUnit, self.unitParams, ['D', 'G', 'S', 'B'], name))
                self.transistorStack.add(self.Units[i])
            

    def genLayout(self):
        #flip para que el terminal positivo se conecte con el negativo
        flip = False
        for unit in self.Units:
            if flip:
                unit.mirrorY()
            flip = not flip

        reference = self.Units[0]
        
        for i in range(1, self.fingers):       
            if i%2 is 0:
                offset = self.Units[i+1].findInstPin("S").getBBox(self.metLayer).right - self.Units[i].findInstPin("S").getBBox(self.metLayer).left -0.1
            else:
                offset = self.Units[i+1].findInstPin("D").getBBox(self.metLayer).right - self.Units[i].findInstPin("D").getBBox(self.metLayer).left -0.1
        
            place(self.Units[i], EAST, reference, offset)    

