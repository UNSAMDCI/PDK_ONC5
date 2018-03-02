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

__version__ = "1.0"
__author__ = "lucho"

from cni.dlo import *
from cni.geo import *
from cni.constants import *
from cni.integ.common import *

class resistor_unit(DloGen):

    @classmethod
    def defineParamSpecs(cls, specs):

        tech = Tech.get('c5')
        # first use variables to set default values for all parameters
        resLayer = tech.getLayer('POLY1')
        resType  = tech.getLayer('RES')

        w = tech.getPhysicalRule('minWidth', resLayer)
        l = tech.getPhysicalRule('minWidth', resLayer)
        
        specs('w', w, 'Device w')   
        specs('l', l, 'Device l')   
        specs('resLayer',resLayer, 'Poly layer')
        specs('resType',resType, 'Resistance Layer')
        specs('cnt', True, 'contact on pads')   
        specs('resName' , 'wololo', 'Device name')
        specs('terminal', 'BOTH', '', ChoiceConstraint(['PLUS', 'MINUS', 'BOTH','NONE']))

    def setupParams(self, params):

        # save parameter values using class variables
        self.w = params['w']
        self.l = params['l']
        self.cnt = params['cnt']
        self.resName  = params['resName']
        self.resLayer = params['resLayer']
        self.terminal = params['terminal']
        self.resType  = params['resType']

        self.metLayer  = Layer('M1')
        self.cntLayer  = Layer('CNT')
        self.termLayer = Layer('TERM')

        self.minSpace = self.tech.getPhysicalRule('minSpacing', self.metLayer,self.metLayer)

        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)
    
    def genLayout(self):
        
        #creo la res layer y la res type

        resBox  = Box(-self.w/2,-self.l/2,self.w/2,self.l/2)
        resRect = Rect(self.resLayer, resBox)

        resTypeRect = Rect(self.resType, resBox)

        #contact type, pure metal or full contact
        if self.cnt:
            textLayer = self.metLayer 
            pinBox       = Box(-self.w/2,-self.cnt/2,self.w/2,self.cnt/2)
            plusContact  = DeviceContact(self.resLayer, self.metLayer, pinBox, name='PLUS')
            minusContact = DeviceContact(self.resLayer, self.metLayer, pinBox, name='MINUS')
            
            bottom = minusContact.getBBox().bottom
            top = minusContact.getBBox().top
            plusContact.stretch(self.metLayer, Box(-self.w/2,bottom,self.w/2,top))
            minusContact.stretch(self.metLayer, Box(-self.w/2,bottom,self.w/2,top))
        else:
            textLayer = self.resLayer
            minWidth     = self.tech.getPhysicalRule('minWidth', self.resLayer)
            contactBox   = Box(-self.w/2,0,self.w/2,minWidth)
            plusContact  = Rect(self.resLayer,contactBox)
            minusContact = Rect(self.resLayer,contactBox)

        plusContact.place(NORTH, resRect, 0)
        minusContact.place(SOUTH, resRect, 0)

        #pongo layer TERM 
        termBoxPlus = plusContact.getBBox()
        termRectPlus = Rect(self.termLayer, termBoxPlus)

        termBoxMinus = minusContact.getBBox()
        termRectMinus = Rect(self.termLayer, termBoxMinus)

        # add the terminals for this resistor unit
        self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # positive terminal
        self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal
        self.setTermOrder(['PLUS', 'MINUS'])

        # also define the pins for this resistor unit
        self.addPin('PLUS', 'PLUS', plusContact.getBBox(), self.resLayer)
        self.addPin('MINUS', 'MINUS', minusContact.getBBox(), self.resLayer)

        #texto para el lvs
        if self.terminal == 'BOTH' :
            textoPlus = Text(layer = textLayer,
                             text = 'PLUS', 
                             origin = plusContact.getBBox().centerCenter(), 
                             height = 0.1,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN) 

            textoMinus = Text(layer = textLayer,
                             text = 'MINUS', 
                             origin = minusContact.getBBox().centerCenter(), 
                             height = 0.1,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN) 

        elif self.terminal == 'PLUS' :
            textoPlus = Text(layer = self.metLayer,
                             text = 'PLUS', 
                             origin = plusContact.getBBox().centerCenter(), 
                             height = 0.1,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN) 

        elif self.terminal == 'MINUS' :
            textoMinus = Text(layer = self.metLayer,
                             text = 'MINUS', 
                             origin = minusContact.getBBox().centerCenter(), 
                             height = 0.1,
                             location = Location.CENTER_CENTER, 
                             orient = Orientation.R0,
                             font = Font.ROMAN) 
        else:
            pass

        texto = Text(layer = self.resType,
                     text = self.resName, 
                     origin = Point(0,0), 
                     height = 0.05,
                     location = Location.CENTER_CENTER, 
                     orient = Orientation.R0,
                     font = Font.ROMAN) 
