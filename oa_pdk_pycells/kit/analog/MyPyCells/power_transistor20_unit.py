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

class power_transistor20_unit(DloGen):
    @classmethod
    def defineParamSpecs(cls, specs):
    #--------------------------------------------------------------------------------------------
    #
    # SETEO DE VARIABLES PARAMETRIZABLES
    #
    #--------------------------------------------------------------------------------------------
        #Min N
        NZCHL_Rule  = 5.0
        EXNCHW_Rule = 5.0 
        # Min P
        EXPCHW = 5.0
        PZCHL  = 5.0

        tech        = Tech.get('c5')
        model       = 'nMOS'

        # now use these default parameter values in the parameter definitions
        specs('model', model, 'MOSFET type (pMOS or nMOS)', ChoiceConstraint(['pMOS', 'nMOS']))
        specs('name', 'Wololo', 'power transistor name')

        specs('mosW', 10.0, 'Device w')
        specs('mosL', 10.0, 'Device l')

        specs('mosSourceContact',True,'on/off source pad')
        specs('mosDrainContact',True,'on/off drain pad')
        #variable para que no se pisen los NWell y demas cuando hay fingers
        specs('fingerPadSource',False,'special Source Nwell for multiple fingers')
        specs('fingerPadDrain',False,'special Drain Nwell for multiple fingers')

        specs('ThkGate', True,'On/Off Thick gate layer')

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

        self.sourcePad  = params['mosSourceContact']
        self.drainPad   = params['mosDrainContact']

        self.fingerPadSource  = params['fingerPadSource']
        self.fingerPadDrain  = params['fingerPadDrain']

        self.ThkGate = params['ThkGate']

        #basic Layers
        self.met1Layer  = Layer('M1')
        self.difLayer   = Layer('DIF')
        self.gateLayer  = Layer('POLY1')
        self.tubLayer   = Layer('TUB')
        self.nWellLayer = Layer('NFIELD')

        self.drecLayer  = Layer('DREC')
        self.thkgtLayer = Layer('THKGT')
        self.exdifLayer = Layer('EXDIF')
        self.pplsLayer  = Layer('PPLS')
        self.nplsLayer  = Layer('NPLS')


        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)

        #parameters of distance if Source || Drain pads are off
        self.srcPlaceDistance  = 0
        self.drnPlaceDistance  = 0
        self.srcDif            = 0
        self.drnDif            = 0
        self.padGateExtension  = 0
        self.drftRule          = 0
        self.ReferenceStack    = Grouping('ReferenceStack')
        
        self.minWM1     = self.tech.getPhysicalRule('minWidth', Layer('M1'))
        self.minCont    = self.tech.getPhysicalRule('minWidth', Layer('CNT'))
        self.minExt     = self.tech.getPhysicalRule('minExtension', self.met1Layer, Layer('CNT'))
        self.minExtCP1  = self.tech.getPhysicalRule('minExtension', self.gateLayer, Layer('CNT'))

        #self.minExt_DIF_PPLS  = self.tech.getPhysicalRule('minExtension', self.difLayer, self.pplsLayer)

        self.NZCHL_Rule  = 5.0
        self.EXNCHW_Rule = 5.0 
        self.MXPNDW_Rule = 1.1 #pad rule en el pdk esta otra cosa
        self.MWONXG_Rule = 0#0.5
        self.PXBXNG_Rule = 1.0
        self.NZDRFT_Rule = 3.0
        self.NWEXND_Rule = 1.0
        self.NCEXDW_Rule = 0.5

        self.EXPCHW_Rule = 5.0
        self.PZCHL_Rule  = 5.0
        self.PXBXPG_Rule = 1.0
        self.PZDRFT_Rule = 3.0
        #self.MXPNDW_Rule = 1.1 repetido
        self.NWEOPF_Rule = 3.0
        self.NCEXDW_Rule = 0.5

        
        #Pmos
        self.PFOLXP_Rule = 0.3
        self.PFEODA_Rule = 1.0
        #self.EXPGER = no esta
        #ring
        #self.PFNDSP_Rule = 1.0

    def genToplogy(self):
        return

    def sizeDevices(self):
        # code to size different devices

        if self.model == 'nMOS':
            self.padGateExtension = self.PXBXNG_Rule
            self.drftRule = 2.5#self.NZDRFT_Rule
        else:
            self.padGateExtension = self.PXBXPG_Rule
            self.drftRule = 3.0#self.PZDRFT_Rule

        if self.sourcePad:
            self.srcPlaceDistance = self.drftRule - self.padGateExtension - self.MWONXG_Rule
            self.srcDif = self.l/2
        else:
            self.srcPlaceDistance = 0.1
            self.srcDif = self.l/2 + self.padGateExtension + 0.1

        if self.drainPad:
            self.drnPlaceDistance = self.drftRule - self.padGateExtension - self.MWONXG_Rule
            self.drnDif = self.l/2
        else:
            self.drnPlaceDistance = 0.1
            self.drnDif = self.l/2 + self.padGateExtension + 0.1

    def genLayout(self):
    ### PADS creation ###
        contactW = 0.9 #self.MXPNDW_Rule
        contactL = self.w 
        contactBox = Box(-contactW/2,-contactL/2,contactW/2,contactL/2)
        sourceContact = DeviceContact(self.difLayer, self.met1Layer, contactBox, name='S')
        drainContact  = DeviceContact(self.difLayer, self.met1Layer, contactBox, name='D')

        contactW = self.minCont + 2*self.minExtCP1
        contactL = self.l
        gateContactBox = Box(-contactL/2,-contactW/2,contactL/2,contactW/2)
        gateContact = DeviceContact(self.gateLayer, self.met1Layer, gateContactBox, name='G')
        gateContact1= DeviceContact(self.gateLayer, self.met1Layer, gateContactBox, name='G1')

    ### DIF & POLY Rects
        difBox = Box( -self.srcDif, -self.w/2, self.drnDif, self.w/2)
        difRect = Rect(self.difLayer, difBox)

        gateBox = Box(-(self.l/2 + self.padGateExtension),-self.w/2,self.l/2 + self.padGateExtension,self.w/2 )

        gateBox.expandDir(SOUTH, 0.2)
        gateBox.expandDir(NORTH, 0.2)
        gateRect = Rect(self.gateLayer, gateBox)

    ### EXDIF LAYER
        top = gateBox.top - 0.2
        bot = gateBox.bottom + 0.2
        if self.sourcePad:
            left = gateBox.left - self.drftRule + self.padGateExtension
            right = gateBox.left + self.padGateExtension
            exdif1Box = Box(left,bot,right,top)
            exdif1Rect = Rect(self.exdifLayer,exdif1Box) #izquiera
        
        if self.drainPad:
            left = gateBox.right - self.padGateExtension
            right = gateBox.right + self.drftRule - self.padGateExtension
            exdif2Box = Box(left,bot,right,top)
            exdif2Rect = Rect(self.exdifLayer,exdif2Box) #derecha

    ### PADS PLACE
        if self.sourcePad:
            place(sourceContact, WEST, exdif1Rect, 0)
        else:
            place(sourceContact, WEST, difRect, 0)

        if self.drainPad: 
            place(drainContact , EAST, exdif2Rect, 0)
        else:
            place(drainContact , EAST, difRect, 0)

        place(gateContact , NORTH, gateRect, 0)
        place(gateContact1, SOUTH, gateRect, 0)

        top   = gateContact.getBBox(self.met1Layer).bottom
        bot   = gateContact1.getBBox(self.met1Layer).top
        left  = -self.minWM1/2
        right = self.minWM1/2
        gateMidBox = Box(left,bot,right,top)
        gateMidRect = Rect(self.met1Layer,gateMidBox)

        top   = gateContact.getBBox(self.gateLayer).top
        bot   = gateContact.getBBox(self.gateLayer).bottom
        left  = gateContact.getBBox(self.gateLayer).left - self.padGateExtension
        right = gateContact.getBBox(self.gateLayer).right + self.padGateExtension
        gateContact.stretch(self.gateLayer, Box(left,bot,right,top))

        top   = gateContact1.getBBox(self.gateLayer).top
        bot   = gateContact1.getBBox(self.gateLayer).bottom
        gateContact1.stretch(self.gateLayer, Box(left,bot,right,top))

    ### TUB & NFIELD, NPLS & PPLS LAYER ###
        if self.model == 'nMOS':
            top   = sourceContact.getBBox(self.difLayer).top    + self.NWEXND_Rule #+ self.NCEXDW_Rule
            bot   = sourceContact.getBBox(self.difLayer).bottom - self.NWEXND_Rule #- self.NCEXDW_Rule
            if self.sourcePad:
                left  = sourceContact.getBBox(self.difLayer).left   - self.NWEXND_Rule #- self.NCEXDW_Rule
                right = difBox.left + self.MWONXG_Rule + self.NCEXDW_Rule
                tub1Box = Box(left,bot,right,top)
                tub1Rect = Rect(self.tubLayer,tub1Box)
                nfield1Box = tub1Rect.getBBox().expand(self.NCEXDW_Rule)
                nfield1Rect = Rect(self.nWellLayer,nfield1Box)
            
            if self.drainPad:
                right  = drainContact.getBBox(self.difLayer).right + self.NWEXND_Rule #+ self.NCEXDW_Rule
                left   = difBox.right - self.MWONXG_Rule - self.NCEXDW_Rule
                tub2Box = Box(left,bot,right,top)
                tub2Rect = Rect(self.tubLayer,tub2Box)
                nfield2Box = tub2Rect.getBBox().expand(self.NCEXDW_Rule)
                nfield2Rect = Rect(self.nWellLayer,nfield2Box)
        else:
            dummyList = []
            top   = sourceContact.getBBox(self.difLayer).top    + self.PFEODA_Rule
            bot   = sourceContact.getBBox(self.difLayer).bottom - self.PFEODA_Rule
            ################
            # lo uso para cuando hay multiples fingers no se solapen
            #################
            if self.sourcePad:
                right = exdif1Rect.getBBox().right + self.PFOLXP_Rule
                if self.fingerPadSource:
                    left  = sourceContact.getBBox(self.difLayer).left - 3.8# self.PFEODA_Rule
                else:
                    left  = sourceContact.getBBox(self.difLayer).left - self.PFEODA_Rule

                dummyBox1 = Box(left,bot,right,top)
                dummyRect1 = Rect(self.nWellLayer,dummyBox1)
                dummyList.append(dummyRect1)

            ################
            # lo uso para cuando hay multiples fingers no se solapen
            #################
            if self.drainPad:
                left  = exdif2Rect.getBBox().left - self.PFOLXP_Rule
                if self.fingerPadDrain:
                    right = drainContact.getBBox(self.difLayer).right + 3.8
                else:
                    right = drainContact.getBBox(self.difLayer).right + self.PFEODA_Rule

                dummyBox2 = Box(left,bot,right,top)
                dummyRect2 = Rect(self.nWellLayer,dummyBox2)
                dummyList.append(dummyRect2)

            self.ReferenceStack.add(sourceContact)
            self.ReferenceStack.add(drainContact)
            self.ReferenceStack.add(difRect)
            ### PPLS & NPLS
            plsBox   = self.ReferenceStack.getBBox(self.difLayer).expand(0.45)
            nplsRect = Rect(self.nplsLayer,plsBox)
            pplsRect = Rect(self.pplsLayer,plsBox)

            tubBox = nplsRect.getBBox().expand(4.15)#self.NWEOPF_Rule)
            tubRect = Rect(self.tubLayer,tubBox)
            nfieldBox = tubRect.getBBox().expand(self.NCEXDW_Rule)
            nfieldRect = Rect(self.nWellLayer,nfieldBox)
            
            if dummyList:
                destroyList =[]
                destroyList.append(nfieldRect)
                for i,dummies in enumerate(dummyList):
                    destroyList.append(destroyList[i].fgNot(comp = dummies,resultLayer = self.nWellLayer))
                    dummies.destroy()
                destroyListLen = len(destroyList)
                for i in range(0, destroyListLen - 1):
                    destroyList[i].destroy()
            
    ### THKGT & DREC LAYER & PMOS Layers###
        top   = gateBox.top + 0.1
        bot   = gateBox.bottom - 0.1
        left  = sourceContact.getBBox(self.difLayer).left - 0.3
        right = drainContact.getBBox(self.difLayer).right + 0.3


        thkgtBox = Box(left,bot,right,top)
        if self.ThkGate:
            thkgtRect = Rect(self.thkgtLayer,thkgtBox)

        top = gateContact.getBBox().top
        bot = thkgtBox.bottom
        left = thkgtBox.left 
        right = thkgtBox.right 

        drecBox = thkgtBox.expand(1.7)
        drecRect = Rect(self.drecLayer,drecBox)


    ### PINES Y TERMINALES ###
        # add the terminals for this transistor unit
        self.addTerm('S', TermType.INPUT_OUTPUT)    # source terminal
        self.addTerm('D', TermType.INPUT_OUTPUT)    # drain terminal
        self.addTerm('G', TermType.INPUT)           # gate terminal
        self.addTerm('B', TermType.INPUT_OUTPUT)    # bulk (substrate) terminal
        self.setTermOrder(['D', 'G', 'S', 'B'])

        self.addPin('G', 'G', gateContact.getBBox(self.met1Layer), self.met1Layer)
        self.addPin('G1', 'G', gateContact1.getBBox(self.met1Layer), self.met1Layer)
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
        textoMain = Text(layer = self.drecLayer,
                         text = self.name, 
                         origin = textLocS, 
                         height = 0.3,
                         location = Location.CENTER_CENTER, 
                         orient = Orientation.R0,
                         font = Font.ROMAN) 
