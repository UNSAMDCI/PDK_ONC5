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

from resistor_unit     import *


class resistor(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------  
        tech = Tech.get('c5')   

        resLayer    = tech.getLayer('POLY1')    
        #R es el total total y L de cada finger
        specs('model', 'npor', 'Device model',ChoiceConstraint(['npor','nporxwnl','hipor','hiporxwnl','po2r','po2rxwnl', 'm1r', 'm2r', 'm3r','nprpwnl']))
        specs('resL', tech.getPhysicalRule('minWidth', resLayer), 'Device length')   
        specs('resW', tech.getPhysicalRule('minWidth', resLayer), 'Device width')
        specs('Resistance', 2000.0 , 'Device resistance')
        specs('resUnit', 1,'asdasd', RangeConstraint(1, 100, USE_DEFAULT))
        specs('space',False,'activar distancia entre resistencias variable')
        specs('resSpacing',0.6,'distancia entre resistencias variable')
        specs('resRemoveConns',False,'ON/OFF conexion entre resistencias')

        #parametros para resistencias con "xw"
        specs('shield','Ptype', 'guard ring type',ChoiceConstraint(['Ntype','Ptype','NONE']))
        specs('gap',0.0,'genera un espacio en el ring2')

    def setupParams(self, params):
    #--------------------------------------------------------------------------------------------
    #
    # CONSTRUCTOR, SE ENCARGA DE QUE EL RESTO DE LAS CLASES VEAN LOS 
    # MISMOS PARAMETROS Y COSAS LOCAS
    #
    #--------------------------------------------------------------------------------------------
    
        #basic params
        self.model       = params['model']
        self.w           = params['resW'] #* 1000000.0
        self.l           = params['resL'] #* 1000000.0
        self.r           = params['Resistance']

        #spacing and interconnect params
        self.fingers     = params['resUnit']
        self.space       = params['space']
        self.spaceWidth  = params['resSpacing']
        self.interconnect= params['resRemoveConns']
        #guard ring parameters
        self.shield      = params['shield']
        self.gap         = params['gap']
        #misc
        self.baseName       = self.model
        self.resistorStack  = Grouping('resistorStack')
        self.unitParams     = ParamArray()
        self.Units          = []
        self.metLayer       = Layer('M1')
        self.difLayer       = Layer('DIF')
        self.cnt            = True #used to choose type of contact

        if self.model == 'po2r':
            self.resLayer    = Layer('POLY2')
            self.resType     = Layer('RES')
            self.cnt         = True
        elif self.model == 'po2rxwnl':
            self.resLayer    = Layer('POLY2')
            self.resType     = Layer('RES')
            self.cnt         = True
        elif self.model == 'npor':
            self.resLayer    = Layer('POLY1')
            self.resType     = Layer('RES')
            self.cnt         = True
        elif self.model == 'hipor':
            self.resLayer    = Layer('POLY2')
            self.resType     = Layer('RES')
            self.cnt         = True 
            self.minExtP2    = self.tech.getPhysicalRule('minExtension',Layer('HIRES'),self.resLayer)
        elif self.model == 'hiporxwnl':
            self.resLayer    = Layer('POLY2')
            self.resType     = Layer('RES')
            self.cnt         = True 
            self.minExtP2    = self.tech.getPhysicalRule('minExtension',Layer('HIRES'),self.resLayer)
        elif self.model == 'nporxwnl':
            self.resLayer    = Layer('POLY1')
            self.resType     = Layer('RES')
            self.cnt         = True
        elif self.model == 'm1r':
            self.resLayer    = Layer('M1')
            self.resType     = Layer('RES')
            self.cnt         = False
        elif self.model == 'm2r':
            self.resLayer    = Layer('M2')
            self.resType     = Layer('RES')
            self.cnt         = False
        elif self.model == 'm3r':
            self.resLayer    = Layer('M3')
            self.resType     = Layer('RES')
            self.cnt         = False
        elif self.model == 'nprpwnl':
            self.resLayer    = Layer('DIF')
            self.resType     = Layer('RES')
            self.cnt         = True
        else:
            pass

        self.minResSpace = self.tech.getPhysicalRule('minSpacing', self.resLayer,self.resLayer)
        self.minMetSpace = self.tech.getPhysicalRule('minSpacing', self.metLayer,self.metLayer)
        self.minResWidth = self.tech.getPhysicalRule('minWidth', self.resLayer)
        self.minMetWidth = self.tech.getPhysicalRule('minWidth', self.metLayer)



    def genToplogy(self):
    #--------------------------------------------------------------------------------------------
    #
    # INSTANCIACION DE LOS COMPONENTES
    #
    #--------------------------------------------------------------------------------------------
        defaultParams = ParamArray()
        self.resistorStack = Grouping('resistorStack')

        for i in range(self.fingers):
            name = self.baseName + str(i)+ " W="+ str(self.w) +" L="+ str(self.l)+" R="+ str(self.r)
            self.Units.append(Instance('resistor_unit', defaultParams, ['PLUS', 'MINUS'], name))
            self.resistorStack.add(self.Units[i])

            self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # substract terminal
            self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
            self.addTerm('SUB', TermType.INPUT_OUTPUT)      # substract terminal
            self.setTermOrder(['PLUS', 'MINUS','SUB'])
        else:
            self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # positive terminal
            self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
            self.setTermOrder(['PLUS', 'MINUS'])

    def sizeDevices(self):
    # code to size different devices
        if 'hi' in self.model:
            lf = (self.l / self.fingers) + 0.6
        else:
            lf = self.l / self.fingers

        self.unitParams = ParamArray(w = self.w,
                                    l = lf,
                                    resLayer = self.resLayer,
                                    resType  = self.resType,
                                    cnt      = self.cnt,
                                    resName  = self.model,
                                    terminal = 'BOTH')
    def genLayout(self):

    #--------------------------------------------------------------------------------------------
    #
    # SETEO TERMINALES 
    #
    #--------------------------------------------------------------------------------------------

    #if para cambiar el nombre de los terminales y que no se repita y dejar el primero y el ultimo con el defecto
        if self.fingers is not 1 :
            for i in range(self.fingers):
                name = self.baseName + str(i)+ " W="+ str(self.w) +" L="+ str(self.l)+" R="+ str(self.r)
                if i == 0:
                    self.unitParams.set(terminal = 'PLUS')
                    self.Units.append(Instance(dloName  = 'resistor_unit',
                                               params   = self.unitParams,
                                               nodeSpec = ['PLUS', 'MINUS'+str(i)],
                                               name     = name))
                elif i == self.fingers-1:
                    self.unitParams.set(terminal = 'MINUS')
                    self.Units.append(Instance('resistor_unit', self.unitParams, ['PLUS'+str(i), 'MINUS'], name))
                    
                else:
                    self.unitParams.set(terminal = 'NONE')
                    self.Units.append(Instance('resistor_unit', self.unitParams, ['PLUS'+str(i), 'MINUS'+str(i)], name))
                
                self.resistorStack.add(self.Units[i])
        else :
            name = self.baseName + " W="+ str(self.w) +" L="+ str(self.l)+" R="+ str(self.r)
            self.Units.append(Instance('resistor_unit', self.unitParams, ['PLUS', 'MINUS'], name))
            self.resistorStack.add(self.Units[0])        

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

        #if self.interconnect :
        contactLength = self.Units[0].findInstPin("PLUS").getBBox().top - self.Units[0].findInstPin("PLUS").getBBox().bottom
        
        for i in range(1, self.fingers):
            if self.space:
                place(self.Units[i], EAST, reference, self.spaceWidth)    
                reference = self.Units[i]
                if i%2 is not 0:
                    x0 = self.Units[i-1].getBBox().right
                    x1 = x0 + self.spaceWidth
                    y0 = self.Units[i-1].getBBox().bottom
                    y1 = y0 + contactLength
                else:
                    x0 = self.Units[i-1].getBBox().right
                    x1 = x0 + self.spaceWidth
                    #el programa no deja que el punto final sea menor que el inicial
                    y0 = self.Units[i-1].getBBox().top - contactLength
                    y1 = self.Units[i-1].getBBox().top
            else:
                place(self.Units[i], EAST, reference, self.minResSpace)
                reference = self.Units[i]
                if i%2 is not 0:
                    x0 = self.Units[i-1].getBBox().right
                    x1 = x0 + self.minResSpace
                    y0 = self.Units[i-1].getBBox().bottom
                    y1 = y0 + contactLength
                else:
                    x0 = self.Units[i-1].getBBox().right
                    x1 = x0 + self.minResSpace
                    #el programa no deja que el punto final sea menor que el inicial
                    y0 = self.Units[i-1].getBBox().top - contactLength
                    y1 = self.Units[i-1].getBBox().top
            
            if not self.interconnect:
                metBox  = Box(x0,y0,x1,y1)
                if self.cnt:
                    metRect = Rect(self.metLayer, metBox)
                else:
                    metRect = Rect(self.resLayer, metBox)

        #si es hi tengo que rodear a toda la capa RES
        if 'hi' in self.model:
            hiresBox = self.resistorStack.getBBox(Layer('RES'))
            
            right = hiresBox.right + self.minExtP2
            left = hiresBox.left - self.minExtP2
            top = hiresBox.top - 0.3
            bottom = hiresBox.bottom + 0.3
            
            hiresBox = Box(left,bottom,right,top)
            hiresRect = Rect(Layer('HIRES'),hiresBox)
        else:
            pass

    #--------------------------------------------------------------------------------------------
    #
    # SET PINES 2 TERMINALS
    #
    #--------------------------------------------------------------------------------------------
        if self.cnt:
            pinLayer = self.metLayer
        else:
            pinLayer = self.resLayer

        plusContact  = self.Units[0].findInstPin("PLUS").getBBox()
        minusContact = self.Units[self.fingers-1].findInstPin("MINUS").getBBox()
        self.addPin('PLUS', 'PLUS', plusContact, pinLayer)
        self.addPin('MINUS', 'MINUS', minusContact, pinLayer)

        if 'xw' in self.model:
            if self.shield == 'Ntype':
                dummyBox = self.resistorStack.getBBox(self.metLayer).expand(self.minMetSpace)
                dummyRect= Rect(self.metLayer,dummyBox)
                contactRing = ContactRing(self.metLayer, self.difLayer,'nType',fillLayers=[Layer('TUB'),Layer('NFIELD')],gap = self.gap)
                tubRect =Rect(Layer('NFIELD'),contactRing.getBBox(Layer('TUB')))
                dummyRect.destroy()
            else:
                contactRing = ContactRing(self.metLayer, self.difLayer,'pType',addLayers=[Layer('PPLS'),Layer('NPLS')],gap = self.gap)

            refRing = Ring2Pin(contactRing,self.metLayer,1.1)

            i=0
            for ref in refRing:
                self.addPin('SUB'+str(i),'SUB',ref.getBBox(self.metLayer),self.metLayer)
                i +=1

            textoSub = Text( layer = self.metLayer,
                             text = 'SUB', 
                             origin = Point(0,refRing[0].getBBox(self.metLayer).bottom + 0.6), 
                             height = 0.1,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN)
            

#--------------------------------------------------------------------------------------------
# Funcion que le paso el ring y me genera un ring para referenciarlo a un terminal
#--------------------------------------------------------------------------------------------
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

