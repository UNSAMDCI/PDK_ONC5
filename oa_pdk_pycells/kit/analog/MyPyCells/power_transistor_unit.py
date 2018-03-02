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

class power_transistor_unit(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------
        #min params N
        NVCHL_Rule  = 5.0 #Min. NV-type nested-drain-CHannel-Length
        NNDCHW_Rule = 4.0 #Min Nested-N-Drain-CHannel Width
        #min params P
        NPDCHW_Rule = 2.3
        PVCHL_Rule  = 3.0

        tech        = Tech.get('c5')
        model       = 'pMOS'

        # now use these default parameter values in the parameter definitions
        specs('model', model, 'MOSFET type (pMOS or nMOS)', ChoiceConstraint(['pMOS', 'nMOS']))
        specs('name', 'Wololo', 'power transistor name')

        if model == 'nMOS':
            w           = NNDCHW_Rule
            l           = NVCHL_Rule 
        else:
            w           = NPDCHW_Rule
            l           = PVCHL_Rule

        specs('mosW', w, 'Device w')
        specs('mosL', l, 'Device l')

        specs('mosGateContact','TOP','Device gatePad', ChoiceConstraint(['TOP', 'BOT']))
        specs('mosSourceContact',True,'on/off source pad')
        specs('mosDrainContact',True,'on/off drain pad')

    def setupParams(self, params):
    #--------------------------------------------------------------------------------------------
    #
    # CONSTRUCTOR, SE ENCARGA DE QUE EL RESTO DE LAS CLASES VEAN LOS MISMOS PARAMETROS
    #
    #--------------------------------------------------------------------------------------------
    
        self.model      = params['model']
        self.name       = params['name']

        self.w          = params['mosW']
        self.l          = params['mosL']

        self.gatePad    = params['mosGateContact']
        self.sourcePad  = params['mosSourceContact']
        self.drainPad   = params['mosDrainContact']
        #basic Layers
        self.met1Layer  = Layer('M1')
        self.met2Layer  = Layer('M2')
        self.difLayer   = Layer('DIF')
        self.gateLayer  = Layer('POLY1')
        self.tubLayer   = Layer('TUB')
        self.nWellLayer = Layer('NFIELD')
        self.nplsLayer  = Layer('NPLS')
        self.pplsLayer  = Layer('PPLS')
        #High Voltage Layers
        self.drecLayer  = Layer('DREC')
        self.thkgtLayer = Layer('THKGT')
        self.npblkLayer = Layer('NPBLK')
        self.ppblkLayer = Layer('PPBLK')

        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)

        #parameters with difference between N & P MOS
        self.padRuleW       = 0
        self.padGateSpace   = 0
        self.difEnclosure   = 0
        self.blkEnclosure   = 0
        self.blkLayer       = Layer('M1')

        #parameters of distance if Source || Drain pads are off
        self.srcPlaceDistance  = 0
        self.drnPlaceDistance  = 0
        self.srcDif            = 0
        self.drnDif            = 0
        
        self.minWM1     = self.tech.getPhysicalRule('minWidth', Layer('M1'))
        self.minCont    = self.tech.getPhysicalRule('minWidth', Layer('CNT'))
        self.minExt     = self.tech.getPhysicalRule('minExtension', self.met1Layer, Layer('CNT'))
        self.minExtCP1  = self.tech.getPhysicalRule('minExtension', self.gateLayer, Layer('CNT'))

        self.NPBOGT_Rule    = 1.5 #Min BLK Enclosure of Active

        self.NVCHL_Rule  = 5.0 #Min. NV-type nested-drain-CHannel-Length
        self.NNDCHW_Rule = 4.0 #Min Nested-N-Drain-CHannel Width
        self.NPBEAC_Rule = 0.5 #Min NPBlk Enclosure of ACtive
        self.NNDWOG_Rule = 0.5 #Nested-N-Drain-Well Overlap of Gate
        self.ACENND_Rule = 0.5 #ACtive Enclosure of Nested-NDrain
        self.NNDEOC_Rule = 0.2 #Min Nested-N-Drain Enclosure Of Contact
        self.NNDGTS_Rule = 0.5 #Nested-N-Drain to Gate Spacing
        self.NNDRNW_Rule = 0.9 #Nested-N-DRaiN Width
        self.NNDWEA_Rule = 0.5 #Nested-N-Drain-Well Enclosure of Active

        self.NPDCHW_Rule = 2.3
        self.PVCHL_Rule  = 3.0
        self.ACENPD_Rule = 0.7
        self.NPDRNW_Rule = 0.9
        self.NPDGTS_Rule = 0.7
        self.PPBEAC_Rule = 0.3
        self.NPDWEA_Rule = 2.0
        self.NPDEOC_Rule = 0.2

        
    def genToplogy(self):
        return

    def sizeDevices(self):
        # code to size different devices
        if self.model == 'nMOS':
            self.padRuleW     = self.NNDRNW_Rule
            self.padGateSpace = self.NNDGTS_Rule
            self.difEnclosure = self.ACENND_Rule
            self.blkEnclosure = self.NPBEAC_Rule
            self.blkLayer     = self.npblkLayer
        else:
            self.padRuleW     = self.NPDRNW_Rule
            self.padGateSpace = self.NPDGTS_Rule
            self.difEnclosure = self.ACENPD_Rule
            self.blkEnclosure = self.PPBEAC_Rule 
            self.blkLayer     = self.ppblkLayer

        if self.sourcePad:
            self.srcPlaceDistance = self.padGateSpace - 0.1
            self.srcDif = self.l/2 + 2*self.padGateSpace + self.padRuleW + self.NNDWOG_Rule
        else:
            self.srcPlaceDistance = 0.1
            self.srcDif = self.l/2 + 1.2 + self.padRuleW/2 + 0.05

        if self.drainPad:
            self.drnPlaceDistance = self.padGateSpace - 0.1
            self.drnDif = self.l/2 + 2*self.padGateSpace + self.padRuleW + self.NNDWOG_Rule
        else:
            self.drnPlaceDistance = 0.1
            self.drnDif = self.l/2 + 1.2 + self.padRuleW/2 + 0.05
            

    def genLayout(self):
    ### PADS creation ###
        contactW = self.padRuleW
        contactL = self.w - 2 * self.difEnclosure
        contactBox = Box(-contactW/2,-contactL/2,contactW/2,contactL/2)
        sourceContact = DeviceContact(self.difLayer, self.met1Layer, contactBox, name='S')
        drainContact  = DeviceContact(self.difLayer, self.met1Layer, contactBox, name='D')

        contactW = self.minCont + 2*self.minExtCP1
        contactL = self.l 
        gateContactBox = Box(-contactL/2,-contactW/2,contactL/2,contactW/2)
        gateContact = DeviceContact(self.gateLayer, self.met1Layer, gateContactBox, name='G')
    ### DIF & POLY Rects4
        difBox = Box(-self.srcDif, -self.w/2, self.drnDif, self.w/2)
        difRect = Rect(self.difLayer, difBox)

        gateBox = Box(-self.l/2 - self.NNDWOG_Rule,-(self.w/2 + self.blkEnclosure),self.l/2 + self.NNDWOG_Rule,self.w/2 + self.blkEnclosure)

        gateRect = Rect(self.gateLayer, gateBox)
    ### PADS PLACE
        place(sourceContact, WEST, gateRect, self.srcPlaceDistance)
        place(drainContact, EAST, gateRect, self.drnPlaceDistance)
        if self.gatePad == 'TOP':
            place(gateContact, NORTH, gateRect, 0)
        else:
            place(gateContact, SOUTH, gateRect, 0)

        top = gateContact.getBBox().top
        bot = gateContact.getBBox().bottom
        left = gateRect.getBBox().left
        right = gateRect.getBBox().right
        gateContact.stretch(self.gateLayer, Box(left,bot,right,top))
        gateContact.stretch(self.met1Layer, Box(left,bot,right,top))
        
        #para que pace el drc
        if self.model == 'pMOS':
            gateRect.expandDir(SOUTH, 0.2)

    ### TUB & NWELL LAYER ###
        if self.model == 'nMOS':
                
            top = gateRect.getBBox().top
            bot = gateRect.getBBox().bottom
            left = difRect.getBBox().left - 0.5
            right = gateRect.getBBox().left + self.NNDWOG_Rule

            tubBox = Box(left,bot,right,top)
            if self.sourcePad:
                tubRect = Rect(self.tubLayer,tubBox)
                nWell1Rect = Rect(self.nWellLayer,tubBox)

            left = gateRect.getBBox().right - self.NNDWOG_Rule
            right = difRect.getBBox().right + 0.5

            tub2Box = Box(left,bot,right,top)
            if self.drainPad:
                tub2Rect = Rect(self.tubLayer,tub2Box)
                nWell2Rect = Rect(self.nWellLayer,tub2Box)      
        else :
            tubBox = difRect.getBBox(self.difLayer).expand(self.NPDWEA_Rule)
            tubRect = Rect(self.tubLayer,tubBox)
            nWellRect = Rect(self.nWellLayer,tubBox)

    ### NPBLK & PPBLK -> LAYER ###
        top   = difBox.top + self.blkEnclosure # 0.3 #self.NPBEAC_Rule
        bot   = difBox.bottom - self.blkEnclosure # 0.3 #self.NPBEAC_Rule
        
        left  = difBox.left - self.blkEnclosure # 0.3 #self.NPBEAC_Rule
        right = gateBox.left + self.NPBOGT_Rule 
        blk1Box = Box(left,bot, right ,top)

        right = difBox.right + self.blkEnclosure # 0.3 #self.NPBEAC_Rule
        left = gateBox.right - self.NPBOGT_Rule 
        blk2Box = Box(left,bot, right ,top)

        # a la npblk1Rect le hago una NOT con la recta y el resultado va en blkLayer
        if self.sourcePad:
            blk1Rect = Rect(self.blkLayer, blk1Box)
            dummyMet1Box = sourceContact.getBBox(self.difLayer).expandDir(EAST_WEST,-0.1)
            dummyMet1Rect = Rect(self.met1Layer,dummyMet1Box)
            asd1 =blk1Rect.fgNot(comp = dummyMet1Rect,resultLayer = self.blkLayer)
            blk1Rect.destroy()
        
        if self.drainPad:
            blk2Rect = Rect(self.blkLayer, blk2Box)
            dummyMet2Box = drainContact.getBBox(self.difLayer).expandDir(EAST_WEST,-0.1)
            dummyMet2Rect = Rect(self.met1Layer,dummyMet2Box)
            asd2 = blk2Rect.fgNot(comp = dummyMet2Rect,resultLayer = self.blkLayer)        
            blk2Rect.destroy()

    ### THKGT & DREC LAYER & PMOS Layers###
        thkgtBox = difRect.getBBox().expand(0.6)
        thkgtRect = Rect(self.thkgtLayer,thkgtBox)

        top = gateContact.getBBox().top
        bot = thkgtRect.getBBox().bottom
        left = thkgtRect.getBBox().left 
        right = thkgtRect.getBBox().right 

        drecBox = Box(left,bot,right,top)
        drecRect = Rect(self.drecLayer,drecBox)
        if self.model == 'pMOS' :
            nplsRect = Rect(self.nplsLayer,thkgtBox)
            pplsRect = Rect(self.pplsLayer,thkgtBox)

    ### PINES Y TERMINALES ###
        # add the terminals for this transistor unit
        self.addTerm('S', TermType.INPUT_OUTPUT)    # source terminal
        self.addTerm('D', TermType.INPUT_OUTPUT)    # drain terminal
        self.addTerm('G', TermType.INPUT)           # gate terminal
        self.addTerm('B', TermType.INPUT_OUTPUT)    # bulk (substrate) terminal
        self.setTermOrder(['D', 'G', 'S', 'B'])

        self.addPin('G', 'G', gateContact.getBBox(self.met1Layer), self.met1Layer)
        self.addPin('S', 'S', sourceContact.getBBox(self.met1Layer), self.met1Layer)
        self.addPin('D', 'D', drainContact.getBBox(self.met1Layer), self.met1Layer)

        textLocS = gateContact.getBBox(self.met1Layer).getCenter()
        textoGate = Text(layer = self.met1Layer,
                         text = 'G', 
                         origin = textLocS, 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN) 

        textLocS = sourceContact.getBBox(self.met1Layer).getCenter()
        textoSource = Text(layer = self.met1Layer,
                         text = 'S', 
                         origin = textLocS, 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN) 
        
        textLocS = drainContact.getBBox(self.met1Layer).getCenter()
        textoDrain = Text(layer = self.met1Layer,
                         text = 'D', 
                         origin = textLocS, 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN) 

        textLocS = gateRect.getBBox().getCenter()
        textoDrain = Text(layer = self.drecLayer,
                         text = self.name, 
                         origin = textLocS, 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN)