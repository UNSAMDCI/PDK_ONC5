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

class nporxw(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------
    
        tech = Tech.get('c5')  

        resLayer    = tech.getLayer('POLY1')    

        #machiar el pdk  tech.getPhysicalRule('minWidth', resLayer)
        specs('model','nporxwnl','model name',ChoiceConstraint(['nporxw','nporxwnl']))
        specs('entryModeDisp', 'LengthWidth', 'se usan los datos (LengthWidth, ResistanceWidth, ResistanceLength)', ChoiceConstraint(['LengthWidth', 'ResistanceWidth', 'ResistanceLength']))
        specs('resL', tech.getPhysicalRule('minWidth', resLayer), 'Device length')   
        specs('resW', tech.getPhysicalRule('minWidth', resLayer), 'Device width')
        specs('Resistance', 2000.0 , 'Device resistance')
        specs('resSpacing',0.6,'distancia entre resistencias variable')
        specs('resRemoveConns',False,'ON/OFF conexion entre resistencias')
        specs('resUnit', 1,'asdasd', RangeConstraint(1, 100, USE_DEFAULT))
        specs('shield','Ptype', 'guard ring type',ChoiceConstraint(['Ntype','Ptype','NONE']))
        specs('gap',0.0,'genera un espacio en el ring2')

    def setupParams(self, params):
    #--------------------------------------------------------------------------------------------
    #
    # CONSTRUCTOR, SE ENCARGA DE QUE EL RESTO DE LAS CLASES VEAN LOS MISMOS PARAMETROS
    #
    #--------------------------------------------------------------------------------------------
    
        #basic params
        self.genType     = params['entryModeDisp']
        self.w           = params['resW'] #* 1000000.0
        self.l           = params['resL'] #* 1000000.0
        self.r           = params['Resistance']

        self.fingers     = params['resUnit']
        #spacing and interconnect params
        self.space       = True #-> sacar
        self.spaceWidth  = params['resSpacing']
        self.interconnect= params['resRemoveConns']
        self.shield      = params['shield']
        self.gap         = params['gap']

        #misc        
        self.resLayer    = Layer('POLY1')
        self.metLayer    = Layer('M1')  
        self.difLayer    = Layer('DIF')

        self.Units       = []

        self.P1R = 25.5 #(ohms/sq)
        self.gridSize = 0.05 #min grid size

        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)

        self.metSpacing = self.tech.getPhysicalRule('minSpacing', self.metLayer,self.metLayer)

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
                                resName  = 'nporxwnl',
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


        #creo los distintos tipos de guard ring
        if self.shield == 'Ntype':
            dummyBox = resistorStack.getBBox(self.metLayer).expand(self.metSpacing)
            dummyRect= Rect(self.metLayer,dummyBox)
            contactRing1 = ContactRing(self.metLayer, self.difLayer,'nType',fillLayers=[Layer('TUB'),Layer('NFIELD')],gap = self.gap)
            tubRect =Rect(Layer('NFIELD'),contactRing1.getBBox(Layer('TUB')))
            dummyRect.destroy()
        elif self.shield == 'Ptype':
            contactRing1 = ContactRing(self.metLayer, self.difLayer,'pType',addLayers=[Layer('PPLS'),Layer('NPLS')],gap = self.gap)
        else :
            contactRing1 = False   

        if contactRing1 is not False:
            self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # substract terminal
            self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
            self.addTerm('SUB', TermType.INPUT_OUTPUT)      # substract terminal
            self.setTermOrder(['PLUS', 'MINUS','SUB'])

            refRing = Ring2Pin(contactRing1,self.metLayer,1.1)

            i=0
            for x in refRing:
                self.addPin('SUB'+str(i),'SUB',x.getBBox(self.metLayer),self.metLayer)
                i +=1

            textoSub = Text( layer = self.metLayer,
                             text = 'SUB', 
                             origin = Point(0,refRing[0].getBBox(self.metLayer).bottom + 0.6), 
                             height = 0.1,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN) 
            
        else:
            self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # substract terminal
            self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
            self.setTermOrder(['PLUS', 'MINUS'])   


        plusContact  = self.Units[0].findInstPin("PLUS").getBBox(self.metLayer)
        minusContact = self.Units[self.fingers-1].findInstPin("MINUS").getBBox(self.metLayer)

        self.addPin('PLUS', 'PLUS', plusContact, self.metLayer)
        self.addPin('MINUS', 'MINUS', minusContact, self.metLayer)

def Ring2Pin(contactRing,pinLayer,width):
    
    top   = contactRing.getBBox(pinLayer).top
    bot   = contactRing.getBBox(pinLayer).bottom
    left  = contactRing.getBBox(pinLayer).left
    right = contactRing.getBBox(pinLayer).right

    infRefBox = Box(left,bot,right,bot+width)
    supRefBox = Box(left,top-width,right,top)
    rgtRefBox = Box(right-width,bot,right,top)
    lftRefBox = Box(left,bot,left+width,top)

    infRefRect = Rect(pinLayer,infRefBox)
    supRefRect = Rect(pinLayer,supRefBox)
    rgtRefRect = Rect(pinLayer,rgtRefBox)
    lftRefRect = Rect(pinLayer,lftRefBox)
    
    refRing = [infRefRect,supRefRect,rgtRefRect,lftRefRect]

    return refRing
