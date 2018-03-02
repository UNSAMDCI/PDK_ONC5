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
from capacitor_unit     import *


class pipc(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------
        tech = Tech.get('c5')
        specs('entryModeDisp', 'LengthWidth', 'se usan los datos (W L, area perimetro)', ChoiceConstraint(['LengthWidth', 'AreaPerimeter']))
        specs('capArea', 100.0, 'el Area del capacitor',RangeConstraint(10.0, None, REJECT))   
        specs('capPeri', 50.0, 'el Perimetro del capacitor',RangeConstraint(10.0, None, REJECT))
        specs('capL', 15.0, 'Device l',RangeConstraint(3.0, None, REJECT))   
        specs('capW', 15.0, 'Device w',RangeConstraint(3.7, None, REJECT))   
        specs('gap',0.0,'genera un espacio en el ring2')
        specs('capM2Top', False, 'agrega un ring al capacitor interior con metal2')

    def setupParams(self, params):
    #--------------------------------------------------------------------------------------------
    #
    # CONSTRUCTOR, SE ENCARGA DE QUE EL RESTO DE LAS CLASES VEAN LOS MISMOS PARAMETROS
    #
    #--------------------------------------------------------------------------------------------
        self.capType    = params['entryModeDisp']
        self.w          = params['capW']
        self.l          = params['capL']
        self.perimetro  = params['capPeri']
        self.area       = params['capArea']
        self.gap        = params['gap']
        self.metal2     = params['capM2Top']

        self.metLayer   = Layer('M1')
        self.cntLayer   = Layer('CNT')
        self.pplLayer   = Layer('PPLS')
        self.nplLayer   = Layer('NPLS')
        self.difLayer   = Layer('DIF')
        self.capInLayer = Layer('POLY2')
        self.capOutLayer= Layer('POLY1')
        self.capLayer   = Layer('CAPM')


        # also snap width and length values to nearest grid points
        grid    = Grid(self.tech.getGridResolution())
        self.w  = grid.snap(self.w, SnapType.ROUND)
        self.l  = grid.snap(self.l, SnapType.ROUND)

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
        
        unitParams = ParamArray(capType     = self.capType,
                                w           = self.w,
                                l           = self.l,
                                perimetro   = self.perimetro,
                                area        = self.area,
                                gap         = self.gap,
                                metal2      = self.metal2
                                )

    #--------------------------------------------------------------------------------------------
    #
    # INSTANCIACION DE LOS COMPONENTES
    #
    #--------------------------------------------------------------------------------------------
    
        baseName = "CAP"

        if self.capType == 'LengthWidth':
            name = baseName + " W="+ str(self.w) +" L="+ str(self.l)
        else:
            name = baseName + " AREA="+ str(self.area) +" PERIMETRO="+ str(self.perimetro)

        capacitorStack = Grouping('capacitorStack')
        
        self.Units.append(Instance('capacitor_unit', unitParams, ['PLUS', 'MINUS'], name))
        capacitorStack.add(self.Units[0])

        self.addTerm('PLUS', TermType.INPUT_OUTPUT)    # positive terminal
        self.addTerm('MINUS', TermType.INPUT_OUTPUT)    # negative terminal

        self.setTermOrder(['PLUS', 'MINUS'])

        minusContact = self.Units[0].findInstPin("MINUS0").getBBox(self.metLayer)
        plusContact  = self.Units[0].findInstPin("PLUS0").getBBox(self.metLayer)

        self.addPin('PLUS', 'PLUS', plusContact, self.metLayer)
        self.addPin('MINUS', 'MINUS', minusContact, self.metLayer)

        texto = Text(layer = self.capLayer,
                     text = 'pipc', 
                     origin = Point(0,0), 
                     height = 0.1,
                     location = Location.CENTER_CENTER, 
                     orient = Orientation.R0,
                     font = Font.ROMAN) 

        