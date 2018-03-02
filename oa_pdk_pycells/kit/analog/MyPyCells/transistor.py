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
from transistor_unit     import *


class transistor(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------
        #unit params
        tech        = Tech.get('c5')
        model       = 'enm'

        # now use these default parameter values in the parameter definitions
        specs('model', model, 'MOSFET type (epm or enm)', ChoiceConstraint(['epm', 'enm']))
        
        specs('mosW', 5.0, 'Device w')
        specs('mosL', 5.0, 'Device l')
        specs('fingers',1,'Device number of fingers')

        specs('mosGateContact','TOP','Device gatePad', ChoiceConstraint(['TOP', 'BOT', 'BOTH', 'NONE']))
        specs('mosPlateGate',False,'on/off metal on all gate')

        specs('mosSourceContact',True,'on/off source pad')
        specs('mosM2OnSrc',False,'on/off Metal2 pads/connects')
        
        specs('mosDrainContact',True,'on/off drain pad')
        specs('mosM2OnDrn',False,'on/off Metal2 pads/connects')

        specs('abut',False,'not a user option')


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
        self.gatePlate  = params['mosPlateGate']

        self.sourcePad  = params['mosSourceContact']
        self.srcM2      = params['mosM2OnSrc']

        self.drainPad   = params['mosDrainContact']
        self.drnM2      = params['mosM2OnDrn']

        self.abut       = params['abut']

        self.metLayer  = Layer('M1')
        self.difLayer  = Layer('DIF')
        self.gateLayer = Layer('POLY1')

        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)

        self.minWM1 = self.tech.getPhysicalRule('minWidth', Layer('M1'))

        self.Units = []

    def genToplogy(self):
        return

    def sizeDevices(self):
        return

    def genLayout(self):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO EL ARRAY CON LOS PARAMETROS A PASARLE A LA INSTANCIA
    #
    #--------------------------------------------------------------------------------------------
        self.w = self.w / self.fingers

        if self.fingers == 1:
            drainPad = self.drainPad
        else:
            drainPad = True

        unitParams = ParamArray(tranType    = self.model,
                                w           = self.w,
                                l           = self.l,
                                gatePad     = self.gatePad,
                                mosPlateGate= self.gatePlate,
                                sourcePad   = True,
                                mosM2OnSrc  = self.srcM2,
                                drainPad    = drainPad,
                                mosM2OnDrn  = self.drnM2,
                                abut        = self.abut
                                )
                
    #--------------------------------------------------------------------------------------------
    #
    # INSTANCIACION DE LOS COMPONENTES
    #
    #--------------------------------------------------------------------------------------------
    
        baseName = "TRANS"
        transistorStack = Grouping('transistorStack')

        for i in range(self.fingers):
            if i == 0:
                unitParams.set(sourcePad = self.sourcePad)
            elif i == self.fingers-1:
                unitParams.set(sourcePad = True)
                unitParams.set(drainPad = self.drainPad)
            else:
                unitParams.set(sourcePad = True)
                unitParams.set(drainPad = True)

            name = baseName+ str(i) + " W="+ str(self.w) +" L="+ str(self.l)
            self.Units.append(Instance('transistor_unit', unitParams, ['D', 'G', 'S', 'B'], name))
            transistorStack.add(self.Units[i])

        self.addTerm('S', TermType.INPUT_OUTPUT)    # source terminal
        self.addTerm('D', TermType.INPUT_OUTPUT)    # drain terminal
        self.addTerm('G', TermType.INPUT)           # gate terminal
        self.addTerm('B', TermType.INPUT_OUTPUT)    # bulk (substrate) terminal

        self.setTermOrder(['D', 'G', 'S', 'B'])

    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE LOS VALORES DE CADA COMPONENTE Y ORIENTACION
    #
    #--------------------------------------------------------------------------------------------
    
        #flip para que el terminal positivo se conecte con el negativo
        flip = False
        for unit in self.Units:
            if flip:
                unit.mirrorY()
            flip = not flip

    #--------------------------------------------------------------------------------------------
    #
    # PLACE AND ROUTE
    #
    #--------------------------------------------------------------------------------------------
        gatePadDict = {}
        if self.gatePad == 'BOTH':
            gatePadDict['TOP'] = True
            gatePadDict['BOT'] = True
        elif self.gatePad == 'TOP':
            gatePadDict['TOP'] = True
            gatePadDict['BOT'] = False
        elif self.gatePad == 'BOT':
            gatePadDict['TOP'] = False
            gatePadDict['BOT'] = True
        else:
            gatePadDict['TOP'] = False
            gatePadDict['BOT'] = False

        #si existe el contacto busca el metal, sino el dif layer
        sourceContact = self.Units[0].findInstPin("S").getBBox()
        drainContact  = self.Units[0].findInstPin("D").getBBox()

        sPin = Pin('S', 'S')
        if self.sourcePad:
            sourcePin = Rect(self.metLayer,sourceContact)
        else:
            sourcePin = Rect(self.difLayer,sourceContact)
        sPin.addShape(sourcePin)
        sourceAbut = sourcePin
        
        dPin = Pin('D', 'D')
        if (not self.drainPad) and (self.fingers is 1):
            drainPin = Rect(self.difLayer,drainContact)
        else:
            drainPin = Rect(self.metLayer,drainContact)
        dPin.addShape(drainPin)
        drainAbut = drainPin
        
        if (self.gatePad == 'NONE'):
            gPin = Pin('G', 'G')
            gateContact   = self.Units[0].findInstPin("G").getBBox()
            gPin.addShape(Rect(self.gateLayer,gateContact))
        else:
            for key,value in gatePadDict.items():
                if value:
                    gPin = Pin('G'+str(key), 'G')
                    gateContact = self.Units[0].findInstPin("G"+str(key)).getBBox()
                    gPin.addShape(Rect(self.gateLayer,gateContact))
        
        if self.fingers is not 1:
            reference = self.Units[0]
            if self.model == 'enm':
                offset = -1.1
            else:
                offset = -4.1

            for i in range(1, self.fingers):
                place(self.Units[i], EAST, reference, offset)
                reference = self.Units[i]
                
                sourceContact = self.Units[i].findInstPin("S").getBBox()
                drainContact  = self.Units[i].findInstPin("D").getBBox()

                sPin = Pin('S'+str(i), 'S')
                sourcePin = Rect(self.metLayer,sourceContact)
                sPin.addShape(sourcePin)
                
                dPin = Pin('D'+str(i), 'D')
                drainPin = Rect(self.metLayer,drainContact)
                dPin.addShape(drainPin)
                if i == self.fingers-1:
                    drainAbut = drainPin

                if (self.gatePad == 'NONE'):
                    gPin = Pin('G'+str(i), 'G')
                    gateContact   = self.Units[i].findInstPin("G").getBBox()
                    gPin.addShape(Rect(self.gateLayer,gateContact))
                else:
                    for key,value in gatePadDict.items():
                        if value:
                            gPin = Pin('G'+str(key)+str(i), 'G')
                            gateContact   = self.Units[i].findInstPin("G"+str(key)).getBBox()
                            gPin.addShape(Rect(self.gateLayer,gateContact))

        sourceAbut.setName('Source')
        drainAbut.setName('Drain')

        autoAbutment(shape = sourceAbut,
                    pinSize = self.w,
                    directions = [WEST],
                    abutClass = "cniMOS",
                    abut2PinEqual   = [ { "spacing":0.0}, { "mosSourceContact" : False, "abut" : True },{ "mosSourceContact": False , "abut" : True }],
                    abut2PinBigger  = [ { "spacing":0.0}, { "mosSourceContact" : False, "abut" : True },{ "mosSourceContact": False , "abut" : True }],
                    abut3PinBigger  = [ { "spacing":0.0}, { "mosSourceContact" : False, "abut" : True },{ "mosSourceContact": False , "abut" : True }],
                    abut3PinEqual   = [ { "spacing":0.0}, { "mosSourceContact" : False, "abut" : True },{ "mosSourceContact": False , "abut" : True }],
                    abut2PinSmaller = [ { "spacing":0.0}, { "mosSourceContact" : False, "abut" : True },{ "mosSourceContact": False , "abut" : True }],
                    abut3PinSmaller = [ { "spacing":0.0}, { "mosSourceContact" : False, "abut" : True },{ "mosSourceContact": False , "abut" : True }],
                    noAbut          = [ { "spacing" : 0.9 } ],
                    #function        = "mosAbut"
                    )

        autoAbutment(shape = drainAbut,
                    pinSize = self.w,
                    directions = [EAST],
                    abutClass = "cniMOS",
                    abut2PinEqual   = [ { "spacing":0.0}, { "mosDrainContact": False , "abut" : True},{ "mosDrainContact": False , "abut" : True}],
                    abut2PinBigger  = [ { "spacing":0.0}, { "mosDrainContact": False , "abut" : True},{ "mosDrainContact": False , "abut" : True}],
                    abut3PinBigger  = [ { "spacing":0.0}, { "mosDrainContact": False , "abut" : True},{ "mosDrainContact": False , "abut" : True}],
                    abut3PinEqual   = [ { "spacing":0.0}, { "mosDrainContact": False , "abut" : True},{ "mosDrainContact": False , "abut" : True}],
                    abut2PinSmaller = [ { "spacing":0.0}, { "mosDrainContact": False , "abut" : True},{ "mosDrainContact": False , "abut" : True}],
                    abut3PinSmaller = [ { "spacing":0.0}, { "mosDrainContact": False , "abut" : True},{ "mosDrainContact": False , "abut" : True}],
                    noAbut          = [ { "spacing" : 0.9 } ],
                    #function        = "mosAbut"
                    )
