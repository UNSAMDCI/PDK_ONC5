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
from cni.integ.cdfUtil import *
from cni.integ.common import *
from resistor_unit     import *


class npor(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------
    
        tech = Tech.get('c5')  

        resLayer    = tech.getLayer('POLY1')    

        specs('model','npor','model name',ChoiceConstraint(['npor']))
        specs('entryModeDisp', 'LengthWidth', 'se usan los datos (LengthWidth, ResistanceWidth, ResistanceLength)', ChoiceConstraint(['LengthWidth', 'ResistanceWidth', 'ResistanceLength']))
        specs('resL', tech.getPhysicalRule('minWidth', resLayer), 'Device length')   
        specs('resW', tech.getPhysicalRule('minWidth', resLayer), 'Device width')
        specs('Resistance', 2000.0 , 'Device resistance')
        specs('resSpacing',0.6,'distancia entre resistencias variable')
        specs('resRemoveConns',False,'ON/OFF conexion entre resistencias')
        specs('resUnit', 1,'asdasd', RangeConstraint(1, 100, USE_DEFAULT))

    def setupParams(self, params):
    #--------------------------------------------------------------------------------------------
    #
    # CONSTRUCTOR, SE ENCARGA DE QUE EL RESTO DE LAS CLASES VEAN LOS MISMOS PARAMETROS
    #
    #--------------------------------------------------------------------------------------------
    
        #basic params
        self.genType     = params['entryModeDisp']
        self.w           = params['resW'] #* 1000000
        self.l           = params['resL'] #* 1000000
        self.r           = params['Resistance']

        self.fingers     = params['resUnit']
        #spacing and interconnect params
        self.space       = True
        self.spaceWidth  = params['resSpacing']
        self.interconnect= params['resRemoveConns']

        #misc        
        self.resLayer    = Layer('POLY1')
        self.metLayer    = Layer('M1')  
        self.Units       = []

        self.P1R = 25.5 #(ohms/sq)
        self.gridSize = 0.05 #min grid size

        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)

    def genToplogy(self):
        return
    # code to generate layout topology
        #baseName = "resistor"
        # create transistor unit for each finger of the transistor
        #defaultParams = ParamArray()        
        #self.Units.append(Instance('resistor_unit', defaultParams, ['PLUS', 'MINUS'], name))
        #self.Units.append(Instance('resistor_unit', defaultParams, ['PLUS', 'MINUS'], name))

    def sizeDevices(self):
        return
    # code to size different devices
        #unitWidth = self.width/self.fingers
        #unitParams = ParamArray(w = self.w,
        #                        l = self.l,
        #                        resLayer = self.resLayer)

    def genLayout(self):
    #el programa pasa estos parametros en micrones
    #--------------------------------------------------------------------------------------------
    #
    # CALCULO DE W Y L
    #
    #--------------------------------------------------------------------------------------------
        #el largo total de cada finger

        if self.genType == 'ResistanceWidth':
            self.l = (self.w * self.r) / self.P1R
            self.l = math.ceil(self.l*10)/10
        elif self.genType == 'LengthWidth':
            self.r = (self.P1R * self.l) / self.w
        elif self.genType == 'ResistanceLength':
            self.w = (self.P1R * self.l) / self.r
            self.w = math.ceil(self.w*10)/10
        else:
            pass

        self.l = self.l / self.fingers
        self.r = self.r / self.fingers        

        terminal = 'BOTH'
        
        unitParams = ParamArray(w = self.w,
                                l = self.l,
                                resName  = "npor",
                                resLayer = self.resLayer,
                                terminal = terminal)
        
    #--------------------------------------------------------------------------------------------
    #
    # INSTANCIACION DE LOS COMPONENTES
    #
    #--------------------------------------------------------------------------------------------
    
        baseName = "res"
        resistorStack = Grouping('resistorStack')

        #if para cambiar el nombrede los terminales y que no se repita y dejar el primero y el ultimo con el defecto
        if self.fingers is not 1 :
            for i in range(self.fingers):
                name = baseName + str(i)+ " W="+ str(self.w) +" L="+ str(self.l)+" R="+ str(self.r)
                if i == 0:
                    unitParams.set(terminal = 'PLUS')
                    self.Units.append(Instance(dloName  = 'resistor_unit',
                                               params   = unitParams,
                                               nodeSpec = ['PLUS', 'MINUS'+str(i)],
                                               name     = name))

                elif i == self.fingers-1:
                    unitParams.set(terminal = 'MINUS')
                    self.Units.append(Instance('resistor_unit', unitParams, ['PLUS'+str(i), 'MINUS'], name))
                    
                else:
                    unitParams.set(terminal = 'NONE')
                    self.Units.append(Instance('resistor_unit', unitParams, ['PLUS'+str(i), 'MINUS'+str(i)], name))
                
                resistorStack.add(self.Units[i])
        else :
            name = baseName + " W="+ str(self.w) +" L="+ str(self.l)+" R="+ str(self.r)
            self.Units.append(Instance('resistor_unit', unitParams, ['PLUS', 'MINUS'], name))
            resistorStack.add(self.Units[0])        

    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE ORIENTACION
    #
    #--------------------------------------------------------------------------------------------
        #flip para que el terminal positivo se conecte con el negativo
        flip = False
        for unit in self.Units:
            if flip:
                unit.mirrorX()
            flip = not flip

    #--------------------------------------------------------------------------------------------
    #
    # PLACE AND ROUTE
    #
    #--------------------------------------------------------------------------------------------
    
        reference = self.Units[0]    
        
        for i in range(1, self.fingers):
            if self.space:
                place(self.Units[i], EAST, reference, self.spaceWidth)    
                if i%2 is not 0:
                    x0 = self.Units[i-1].getBBox(self.metLayer).right
                    x1 = x0 + self.spaceWidth
                    y0 = self.Units[i-1].getBBox(self.metLayer).bottom
                    y1 = y0 + 0.9
                else:
                    x0 = self.Units[i-1].getBBox(self.metLayer).right
                    x1 = x0 + self.spaceWidth
                    #el programa no deja que el punto final sea menor que el inicial
                    y0 = self.Units[i-1].getBBox(self.metLayer).top - 0.9
                    y1 = self.Units[i-1].getBBox(self.metLayer).top
            else:
                place(self.Units[i], EAST, reference, 0.6)
                if i%2 is not 0:
                    x0 = self.Units[i-1].getBBox(self.metLayer).right
                    x1 = x0 + 0.6
                    y0 = self.Units[i-1].getBBox(self.metLayer).bottom
                    y1 = y0 + 0.9
                else:
                    x0 = self.Units[i-1].getBBox(self.metLayer).right
                    x1 = x0 + 0.6
                    #el programa no deja que el punto final sea menor que el inicial
                    y0 = self.Units[i-1].getBBox(self.metLayer).top - 0.9
                    y1 = self.Units[i-1].getBBox(self.metLayer).top
            
            if not self.interconnect:
                metBox  = Box(x0,y0,x1,y1)
                metRect = Rect(self.metLayer, metBox)
            
            reference = self.Units[i]

        self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # positive terminal
        self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
        
        self.setTermOrder(['PLUS', 'MINUS'])

        plusContact  = self.Units[0].findInstPin("PLUS").getBBox(self.metLayer)
        minusContact = self.Units[self.fingers-1].findInstPin("MINUS").getBBox(self.metLayer)
        self.addPin('PLUS', 'PLUS', plusContact, self.metLayer)
        self.addPin('MINUS', 'MINUS', minusContact, self.metLayer)