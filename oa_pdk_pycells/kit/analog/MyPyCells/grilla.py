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
from funciones import *
from transistor import *

class grilla(DloGen):

    @classmethod
    #--------------------------------------------------------------------------------------------
    #
    # User Interface Variables
    #
    #--------------------------------------------------------------------------------------------
    def defineParamSpecs(cls, specs):
        tech = Tech.get('c5')
        specs('length',15.3, 'standard length distance for VCC & GND')
        specs('mosW', 0.8, 'Device w')
        specs('mosL', 0.6, 'Device l')
        specs('numInv',1, 'number of inverters')
        specs('rGate', True, 'Connect gates with POLY1')
    #--------------------------------------------------------------------------------------------
    #
    # Layers definitions & rules
    #
    #--------------------------------------------------------------------------------------------
    def defineLayers(self):
        self.met1Layer  = Layer('M1')
        self.met2Layer  = Layer('M2')
        self.met3Layer  = Layer('M3')
        self.difLayer   = Layer('DIF')
        self.pplsLayer  = Layer('PPLS')
        self.nplsLayer  = Layer('NPLS')
        self.cntLayer   = Layer('CNT')
        self.nWellLayer = Layer('NFIELD')
        self.tubLayer   = Layer('TUB')
        self.commLayer  = Layer('COMMENT')
        self.gateLayer  = Layer('POLY1')
        # minClearance minWidth minSpacing minExtension minSameNetSpacing
        self.minCntW        = self.tech.getPhysicalRule('minWidth', self.cntLayer)
        self.minExtM1Cnt    = self.tech.getPhysicalRule('minExtension', self.met1Layer, self.cntLayer)
        self.minExtPplsDif  = self.tech.getPhysicalRule('minExtension', self.pplsLayer, self.difLayer)
        self.minSpaDifDif   = self.tech.getPhysicalRule('minSpacing', self.difLayer, self.difLayer)        
        
        self.metalList = [self.met1Layer,self.met2Layer,self.met3Layer]
        self.horizontalLayerList = [self.met1Layer,self.met3Layer]
        self.verticalLayerList = [self.met2Layer]
    #--------------------------------------------------------------------------------------------
    #
    # Definition of the 'UNIT' 
    #
    #--------------------------------------------------------------------------------------------
    def genUnitTileRules(self):
        self.padWidth           = 0
        self.padHeight          = 0
        self.minHorizotalWidth  = 0
        self.minVerticalWidth   = 0
        self.minHorizontalSpace = 0
        self.minVerticalSpace   = 0
        
        for layer in self.horizontalLayerList:
            if self.minHorizotalWidth < self.tech.getPhysicalRule('minWidth',layer):
                self.minHorizotalWidth = self.tech.getPhysicalRule('minWidth',layer)
            if self.minHorizontalSpace < self.tech.getPhysicalRule('minSpacing', layer, layer):
                self.minHorizontalSpace = self.tech.getPhysicalRule('minSpacing', layer, layer)

        for layer in self.verticalLayerList:
            if self.minVerticalWidth < self.tech.getPhysicalRule('minWidth',layer):
                self.minVerticalWidth = self.tech.getPhysicalRule('minWidth',layer)
            if self.minVerticalSpace < self.tech.getPhysicalRule('minSpacing', layer, layer):
                self.minVerticalSpace = self.tech.getPhysicalRule('minSpacing', layer, layer)

        for index in range(len(self.metalList)-1):
            contact  = Contact(self.metalList[index],self.metalList[index + 1])
            if self.padWidth < contact.getBBox().getWidth():
                self.padWidth = contact.getBBox().getWidth()
                self.padHeight = contact.getBBox().getHeight()
            contact.destroy()
        
    #--------------------------------------------------------------------------------------------
    #
    # Instance all parameters method
    #
    #--------------------------------------------------------------------------------------------
    def setupParams(self, params):
        # save user parameter values using class variables
        self.length    = params['length']
        self.w         = params['mosW']
        self.l         = params['mosL']
        self.numInv    = params['numInv']
        self.routeGate = params['rGate']
        #transistor instance parameter
        self.width          = self.w*10
        self.baseName       = 'Inv'
        self.invList        = []
        self.nUnits         = []        
        self.pUnits         = []        
        self.PYACSP_Rule    = 0.2 #missing Techfile RULE
        # also snap width and length values to nearest grid points
        grid        = Grid(self.tech.getGridResolution())
        self.width  = grid.snap(self.width, SnapType.ROUND)
        self.length = grid.snap(self.length, SnapType.ROUND)

        self.defineLayers()
        self.genUnitTileRules()
    #--------------------------------------------------------------------------------------------
    #
    # Generate UNIT grid
    #
    #--------------------------------------------------------------------------------------------
    def setInstanceParams(self):
        self.nMOSParams     = ParamArray()
        self.pMOSParams     = ParamArray()
        
        self.nMOSParams = ParamArray(
            model = 'enm',
            mosW = self.w,
            mosL = self.l,
            fingers = 1,
            mosGateContact = 'NONE',
            mosPlateGate = False,
            mosSourceContact = True,
            mosM2OnSrc = False,
            mosDrainContact = True,
            mosM2OnDrn = False,
            abut = False )
        self.pMOSParams = ParamArray(
            model = 'enm',
            mosW = self.w*2,
            mosL = self.l,
            fingers = 1,
            mosGateContact = 'NONE',
            mosPlateGate = False,
            mosSourceContact = True,
            mosM2OnSrc = False,
            mosDrainContact = True,
            mosM2OnDrn = False,
            abut = False )
    #--------------------------------------------------------------------------------------------
    #
    #  Generate instance of components
    #
    #--------------------------------------------------------------------------------------------
    def sizeDevices(self): 
        self.setInstanceParams()

    #--------------------------------------------------------------------------------------------
    #
    # Generate VDD & GND strip
    #
    #--------------------------------------------------------------------------------------------
    def setRef(self):
        supplyBox = Box(-self.width/2,-self.minCntW/2,self.width/2,self.minCntW/2)
        point = Point(0, self.length/2)
        self.supplyContactVCC  = DeviceContact( self.difLayer, self.met1Layer , supplyBox, name='VCC').moveTo(point ,Location.UPPER_CENTER)
        self.supplyContactVCC.stretchToPoint(self.met1Layer,NORTH,Point(0,self.supplyContactVCC.getBBox().getTop()))
        point = Point(0, -self.length/2)
        self.supplyContactGND  = DeviceContact( self.difLayer, self.met1Layer , supplyBox, name='GND').moveTo(point ,Location.LOWER_CENTER)
        self.supplyContactGND.stretchToPoint(self.met1Layer,SOUTH,Point(0,self.supplyContactGND.getBBox().getBottom()))
    #--------------------------------------------------------------------------------------------
    #
    # Generate UNIT grid
    #
    #--------------------------------------------------------------------------------------------
    def instanceInv(self):
        for i in range(self.numInv):
            name = self.baseName + str(i)
            self.nUnits.append(Instance( dloName  = 'transistor',
                                        params   = self.nMOSParams,
                                        nodeSpec = ['D', 'G', 'S', 'B'],
                                        name     = 'N' + name))
            self.pUnits.append(Instance( dloName  = 'transistor',
                                        params   = self.pMOSParams,
                                        nodeSpec = ['D', 'G', 'S', 'B'],
                                        name     = 'P' + name))
    #--------------------------------------------------------------------------------------------
    #
    # Generate UNIT grid
    #
    #--------------------------------------------------------------------------------------------
    def placeInv(self):
        VCCref = Rect(self.met1Layer,self.supplyContactVCC.getBBox(self.met1Layer))
        GNDref = Rect(self.met1Layer,self.supplyContactGND.getBBox(self.met1Layer))
        # distancia de donde empieza el primer inversor 
        invDist = VCCref.getLeft() + self.PYACSP_Rule + self.l + self.padWidth
        for i in range(self.numInv):
            invStack       = Grouping('invStack' + str(i))
            #place N-MOS & P-MOS
            self.nUnits[i].rotate90()
            fgPlace(self.nUnits[i], NORTH, self.supplyContactGND)
            self.nUnits[i].moveTowards(EAST, invDist)
            
            self.pUnits[i].rotate270()
            fgPlace(self.pUnits[i], SOUTH, self.supplyContactVCC)
            self.pUnits[i].moveTowards(EAST, invDist)
            # Create & connect Gate
            if self.routeGate:
                P0 = self.pUnits[i].getBBox(self.gateLayer).getCenter()
                P1 = Point(self.pUnits[i].getBBox(self.gateLayer).getLeft() - self.PYACSP_Rule,P0.y )            
                P3 = self.nUnits[i].getBBox(self.gateLayer).getCenter() 
                P2 = Point(P1.x, P3.y)
                    #no se porque si no es asi no funca
                gatePath = Path(self.gateLayer,self.l,[Point(P0.x,P0.y),Point(P1.x,P1.y),Point(P2.x,P2.y),Point(P3.x,P3.y)])
                invStack.add(gatePath)            
            # Save the hole as a group
            invStack.add(self.nUnits[i])
            invStack.add(self.pUnits[i])
            self.invList.append(invStack)
        
        if self.numInv != 1:
            for i in range(1,self.numInv):
                fgPlace(self.invList[i], EAST, self.invList[i-1])


        VCCref.destroy()
        GNDref.destroy()
    #--------------------------------------------------------------------------------------------
    #
    # Generate UNIT grid
    #
    #--------------------------------------------------------------------------------------------
    def genSupply(self):
        self.supplyContactVCC.destroy()
        self.supplyContactGND.destroy()

        left  = self.invList[0].getBBox().getLeft() 
        right = self.invList[self.numInv-1].getBBox().getRight()


        supplyBox = Box(left,-self.minCntW/2,right,self.minCntW/2)
        point = Point(left, self.length/2)
        self.supplyContactVCC  = DeviceContact( self.difLayer, self.met1Layer , supplyBox, name='VCC').moveTo(point ,Location.UPPER_LEFT)
        self.supplyContactVCC.stretchToPoint(self.met1Layer,NORTH,Point(0,self.supplyContactVCC.getBBox().getTop()))
        point = Point(left, -self.length/2)
        self.supplyContactGND  = DeviceContact( self.difLayer, self.met1Layer , supplyBox, name='GND').moveTo(point ,Location.LOWER_LEFT)
        self.supplyContactGND.stretchToPoint(self.met1Layer,SOUTH,Point(0,self.supplyContactGND.getBBox().getBottom()))
        
        self.VCCEnclosureBox = self.supplyContactVCC.getBBox().expandDir(SOUTH,self.length/2-self.supplyContactVCC.getBBox().getHeight())
        VCCEnclosureRectN    = Rect(self.nWellLayer,self.VCCEnclosureBox)
        VCCEnclosureRectT    = Rect(self.tubLayer,self.VCCEnclosureBox)

        self.GNDEnclosureBox = self.supplyContactGND.getBBox().expand(self.minExtPplsDif)
        GNDEnclosureRectP    = Rect(self.pplsLayer,self.GNDEnclosureBox)
        GNDEnclosureRectN    = Rect(self.nplsLayer,self.GNDEnclosureBox)
    #--------------------------------------------------------------------------------------------
    #
    # Generate UNIT grid
    #
    #--------------------------------------------------------------------------------------------
    def genGrid(self):
        self.inPutBoxList = []
        self.outPutBoxList = []

        leftEnclosure   = self.VCCEnclosureBox.getLeft()
        bottomEnclosure = self.GNDEnclosureBox.getBottom()
        rightEnclosure  = self.VCCEnclosureBox.getRight()
        topEnclosure    = self.VCCEnclosureBox.getTop()

        self.enclosureGridBox  = Box(leftEnclosure,bottomEnclosure,rightEnclosure,topEnclosure)
        enclosureGridRect = Rect(self.commLayer,self.enclosureGridBox)

        Pad = Point(leftEnclosure,bottomEnclosure + self.minExtPplsDif + self.padHeight + self.minVerticalSpace)

        while (Pad.y + self.padHeight + self.minVerticalSpace) < topEnclosure:
            while (Pad.x) < rightEnclosure:
                padGridBox  = Box(0,0,self.padWidth,self.padHeight).moveTo(Pad,Location.LOWER_LEFT)
                padGridRect = Rect(self.commLayer,padGridBox)
                Pad.x += self.padWidth + self.minHorizontalSpace
            self.outPutBoxList.append(padGridBox.getCenter())
            Pad.x = leftEnclosure
            Pad.y += self.padHeight + self.minVerticalSpace
            self.inPutBoxList.append(padGridBox.getCenter())

        
    #--------------------------------------------------------------------------------------------
    #
    # Generate UNIT grid
    #
    #--------------------------------------------------------------------------------------------          
    def routeInv(self):
        VCCref = Rect(self.met1Layer,self.supplyContactVCC.getBBox(self.met1Layer))
        GNDref = Rect(self.met1Layer,self.supplyContactGND.getBBox(self.met1Layer))

        for i in range(self.numInv):
            # Connect Drain
            RoutePath.StraightLine(self.nUnits[i].findInstPin("D"),
                                   self.pUnits[i].findInstPin("D") , self.met1Layer,self.w)
            # connect to Vcc & Gnd
            RoutePath.StraightLine(VCCref,self.pUnits[i].findInstPin("S") , self.met1Layer,self.w*2)
            RoutePath.StraightLine(GNDref,self.nUnits[i].findInstPin("S") , self.met1Layer,self.w)

        VCCref.destroy()
        GNDref.destroy()



    #--------------------------------------------------------------------------------------------
    #
    # Generate Layout
    #
    #--------------------------------------------------------------------------------------------
    def genLayout(self):
        self.setRef()
        self.instanceInv()
        self.placeInv()
        self.genSupply()
        self.genGrid()
        self.routeInv()

