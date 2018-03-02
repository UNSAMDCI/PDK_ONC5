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

from cni.dlo import *
from cni.geo import *
from cni.constants import *
from cni.integ.common import *
import math

class capacitor_unit(DloGen):

    @classmethod
    def defineParamSpecs(cls, specs):

        tech = Tech.get('c5')
        specs('capType', 'LengthWidth', 'se usan los datos (W L, area perimetro)', ChoiceConstraint(['LengthWidth', 'AreaPerimeter']))
        specs('w', 10.0, 'Device w',RangeConstraint(4.0, None, REJECT))   
        specs('l', 10.0, 'Device l',RangeConstraint(4.0, None, REJECT))   
        specs('perimetro', 20.0, 'el Perimetro del capacitor',RangeConstraint(10.0, None, REJECT))
        specs('area', 40.0, 'el Area del capacitor',RangeConstraint(10.0, None, REJECT))   
        specs('gap',0.0,'genera un espacio en el ring2')
        specs('metal2', False, 'agrega un ring al capacitor interior con metal2')
    def setupParams(self, params):
        # save parameter values using class variables

        self.capType = params['capType']
        self.w = params['w']
        self.l = params['l']
        self.perimetro = params['perimetro']
        self.area = params['area']
        self.gap = params['gap']
        self.metal2 = params['metal2']
        
        self.capInLayer  = Layer('POLY2')
        self.capOutLayer = Layer('POLY1')
        self.metLayer  = Layer('M1')
        self.cntLayer  = Layer('CNT')
        self.capLayer  = Layer('CAPM')
        self.difLayer   = Layer('DIF')

        self.cnt = self.tech.getPhysicalRule('minWidth', self.cntLayer)
        self.metSpacing = self.tech.getPhysicalRule('minSpacing', self.metLayer,self.metLayer)

        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)
    
    def genLayout(self):

        if self.capType == 'AreaPerimeter':
            a = 2
            b = -self.perimetro
            c = 2*self.area

            d = b**2 - 4*a*c # cuadratica

            if d < 0:
                print "This equation has no real solution"
            elif d == 0:
                self.w = -b / (2*a)
            else:
                self.w = (-b+math.sqrt(d)) / (2*a)
                #self.w = (-b-math.sqrt(d))/ (2*a)

            self.l = self.area / self.w
            self.w = math.ceil(self.w*10)/10
            self.l = math.ceil(self.l*10)/10

        else:
            self.l = self.l
            self.w = self.w

        self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # positive terminal
        self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
        self.setTermOrder(['PLUS', 'MINUS'])

        #como no hay una funcion que haga un ring adentro calculo una caja mas chica hago un ring y desp 
        #hago con una caja mas grande del mismo mat
        self.wi = self.w - 4*self.metSpacing
        self.li = self.l - 4*self.metSpacing 
        
        dummyInBox = Box(-self.wi/2,-self.li/2,self.wi/2,self.li/2)
        dummyInRect = Rect(self.capInLayer, dummyInBox)

        filler = [self.capInLayer]
        
        if self.metal2:
            self.contactRing1 = ContactRing(Layer('M2'), self.capOutLayer, fillLayers = filler,name = 'MINUS', node = 'MINUS')    
        else:
            self.contactRing1 = ContactRing(self.metLayer, self.capOutLayer, fillLayers = filler,name = 'MINUS', node = 'MINUS')
        
        # also define the pins for this capacitor unit
        refRing = Ring2Pin(self.contactRing1,self.metLayer,0.9)

        i=0
        for x in refRing:
            self.addPin('PLUS'+str(i),'PLUS',x.getBBox(self.metLayer),self.metLayer)
            i +=1
        
        dummyInRect.destroy()

        capInBox  = Box(-self.w/2,-self.l/2,self.w/2,self.l/2)
        capRect   = Rect(self.capLayer, capInBox)
        capDummyRect = Rect(self.capOutLayer, capInBox)
        capInRect = Rect(self.capInLayer, capInBox)

        capDummyRect.destroy()

        filler = [self.capOutLayer]
        self.contactRing2 = ContactRing(self.metLayer, self.capOutLayer, fillLayers = filler,name = 'PLUS',node = 'PLUS',gap = self.gap)

        refRing = Ring2Pin(self.contactRing2,self.metLayer,0.9)

        i=0
        for x in refRing:
            self.addPin('MINUS'+str(i),'MINUS',x.getBBox(self.metLayer),self.metLayer)
            i +=1

        textoPlus = Text(layer = self.metLayer,
                         text = 'PLUS', 
                         origin = Point(0,-self.l/2 + 1.5*self.cnt), 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN) 

        textoMinus = Text(layer = self.metLayer,
                         text = 'MINUS', 
                         origin = Point(0,-self.l/2 - 1.5*self.cnt), 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN) 

        baseName = "CAP"
        
        if self.capType == 'LengthWidth':
            name = baseName + " W="+ str(self.w) +" L="+ str(self.l)
        else:
            name = baseName + " AREA="+ str(self.area) +" PERIMETRO="+ str(self.perimetro)
        
        textoCentro = Text(  layer = self.capInLayer,
                             text = name, 
                             origin = Point(0,0), 
                             height = 0.3,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN) 


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
