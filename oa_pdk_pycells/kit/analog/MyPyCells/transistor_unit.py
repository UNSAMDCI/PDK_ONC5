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

#################################

from cni.dlo import *
from cni.geo import *
from cni.constants import *
from cni.integ.common import *
from math import fabs,sqrt

class transistor_unit(DloGen):

    @classmethod
    def defineParamSpecs(cls, specs):

        tech        = Tech.get('c5')
        l           = tech.getPhysicalRule('minWidth', Layer('POLY1'))
        # now use these default parameter values in the parameter definitions
        specs('tranType', 'enm', 'MOSFET type (epm or enm)', ChoiceConstraint(['epm', 'enm']))
        specs('w', 0.8, 'Device w')
        specs('l', l, 'Device l')

        specs('gatePad','TOP','Device gatePad', ChoiceConstraint(['TOP', 'BOT', 'BOTH', 'NONE']))
        specs('mosPlateGate',False,'on/off metal on all gate')

        specs('sourcePad',True,'on/off source pad')
        specs('mosM2OnSrc',False,'on/off Metal2 pads/connects')

        specs('drainPad',True,'on/off drain pad')
        specs('mosM2OnDrn',False,'on/off Metal2 pads/connects')

        specs('abut',False,'for internal distance if abutment is used')

    def setupParams(self, params):
        # save parameter values using class variables

        self.tranType   = params['tranType']
        self.w          = params['w']
        self.l          = params['l']

        self.gatePad    = params['gatePad']
        self.gatePlate  = params['mosPlateGate']

        self.sourcePad  = params['sourcePad']
        self.srcM2      = params['mosM2OnSrc']

        self.drainPad   = params['drainPad']
        self.drnM2      = params['mosM2OnDrn']
        self.abut       = params['abut']

        self.gateLayer  = Layer('POLY1')
        self.difLayer   = Layer('DIF')
        self.metLayer   = Layer('M1')
        self.viaLayer   = Layer('VIA')
        self.met2Layer  = Layer('M2')
        #epm
        self.tubLayer   =Layer('TUB')
        self.nWellLayer =Layer('NFIELD')
        self.nplsLayer  =Layer('NPLS')
        self.pplsLayer  =Layer('PPLS')

        # also snap width and length values to nearest grid points
        grid = Grid(self.tech.getGridResolution())
        self.w = grid.snap(self.w, SnapType.ROUND)
        self.l = grid.snap(self.l, SnapType.ROUND)
        
        #variables intermedias para no ofuscar el codigo de c
        self.gatePadDict = {}
        self.gateLayers = [self.gateLayer]
        self.gatePadPlacement = True
        self.gatePadPosition  = -1
        self.sourceLayers = []
        self.drainLayers = []
        self.padOffset = 0
        self.leftDiffOffset = 0
        self.rightDiffOffset = 0
        self.SrcDrnReference = Grouping('SrcDrnReference')
        self.encLayers = [self.nplsLayer,self.pplsLayer,self.tubLayer,self.nWellLayer]
        
        self.minCont = self.tech.getPhysicalRule('minWidth', Layer('CNT'))
        self.minExt  = self.tech.getPhysicalRule('minExtension', self.metLayer, Layer('CNT'))
        self.minExtCP1  = self.tech.getPhysicalRule('minExtension', self.gateLayer, Layer('CNT'))
        self.minExtPolDif = self.tech.getPhysicalRule('minExtension', self.gateLayer, self.difLayer)
        self.minExtDifPol = self.tech.getPhysicalRule('minExtension', self.difLayer,self.gateLayer)
        self.minSpaceMetMet = self.tech.getPhysicalRule('minSpacing', self.metLayer, self.metLayer)


    def genToplogy(self):
        pass

    def sizeDevices(self):
        # code to size & construct different attributes of the device
        if self.gatePad == 'BOTH':
            self.gatePadDict['TOP'] = True
            self.gatePadDict['BOT'] = True
            self.gatePadPosition    = 0
        elif self.gatePad == 'TOP':
            self.gatePadDict['TOP'] = True
            self.gatePadDict['BOT'] = False
            self.gatePadPosition    = 0
        elif self.gatePad == 'BOT':
            self.gatePadDict['TOP'] = False
            self.gatePadDict['BOT'] = True
            self.gatePadPosition    = 1
        else:
            self.gatePadDict['TOP'] = False
            self.gatePadDict['BOT'] = False
            self.gatePadPlacement   = False

        if self.gatePlate:
            self.gateLayers.append(self.metLayer)
            self.padOffset = self.minSpaceMetMet
        else:
            self.padOffset = 0.3
        
        if self.srcM2:
            self.sourceLayers.append(self.met2Layer)

        if self.drnM2:
            self.drainLayers.append(self.met2Layer)

        if not self.sourcePad :
            if  self.abut:
                self.leftDiffOffset = 0.3
            else:    
                self.leftDiffOffset = self.minExtDifPol #0.15 es lo que sobresale del contacto
        else:
            self.leftDiffOffset = self.minSpaceMetMet

        if not self.drainPad :
            if self.abut:
                self.rightDiffOffset = 0.3    
            else:
                self.rightDiffOffset = self.minExtDifPol
        else:
            self.rightDiffOffset = self.minSpaceMetMet

    def genLayout(self):
    ### POLY & DIFF rects###
        gateRect = []
        gateDummy= []
        left    = self.l/2
        right   = self.l/2
        bot     = self.w/2 + self.minExtPolDif
        top     = self.w/2 + self.minExtPolDif
        gateBox = Box(-left,-bot,right,top)

        for i,layer in enumerate(self.gateLayers):
            gateRect.append(Rect(layer,gateBox))
        for i,layer in enumerate(self.gateLayers):
            gateDummy.append(Rect(layer,gateBox))
            self.SrcDrnReference.add(gateDummy[i].expandDir(EAST_WEST, 0.1))

        left    = gateBox.left  - self.leftDiffOffset
        right   = gateBox.right + self.rightDiffOffset
        bot     = self.w/2
        top     = self.w/2
        diffBox = Box(left,-bot,right,top)
        diffRect= Rect(self.difLayer,diffBox)
    ### PADS creation ###
        contactW = self.minCont + self.minExt
        contactL = self.w
        contactBox = Box(-contactW/2,-contactL/2,contactW/2,contactL/2)
        if self.sourcePad:
            sourceContact = Contact(layer1 = self.difLayer, 
                                    layer2 = self.metLayer,
                                    addLayers = self.sourceLayers,
                                    name = "S")    
            sourceContact.stretch(contactBox)

        if self.drainPad:
            drainContact  = Contact(layer1 = self.difLayer, 
                                    layer2 = self.metLayer,
                                    addLayers = self.drainLayers,
                                    name = "D")
            drainContact.stretch(contactBox)

        contactL = self.l
        contactW = self.minCont + 2*self.minExtCP1
        gateContactBox = Box(-contactL/2,-contactW/2,contactL/2,contactW/2)

        gatePad = []
        for key,value in self.gatePadDict.items():
            if value:
                gatePad.append(DeviceContact(self.gateLayer, self.metLayer, gateContactBox, name='G'+ str(key)))
            else:
                gatePad.append(False)
    ### PADS PLACEMENT###
        ### porque no funciona el fg place hay que hacer la cuenta a mano ###
        #puntos para calcular la hipotenusa que separa metales del S/D y el G, tiene que ser 0.6 o minSpaceMetMet
        #uso valores absolutos para no tener que preocuparme por el signo -> fabs()
        #funcion moveTo, no me crea los pads centrados en el eje "Y"
        xi = 0 
        xf = 0
        yi = self.minExtPolDif
        
        if self.sourcePad:
            place(sourceContact,WEST,gateRect[0],self.padOffset)
            xi = fabs(sourceContact.getBBox().right)
            yi = fabs(sourceContact.getBBox().top)

        if self.drainPad:
            place(drainContact,EAST,gateRect[0],self.padOffset)
            xi = fabs(drainContact.getBBox().left)
            yi = fabs(drainContact.getBBox().top)
        
        self.SrcDrnReference.destroy()
        
        if self.gatePadPlacement:
            xf = fabs(gatePad[self.gatePadPosition].getBBox().moveTo(destination= Point(0,0),loc = Location.CENTER_CENTER).left)
            yf = yi + sqrt(pow(self.minSpaceMetMet,2) - pow(xf-xi,2))

            gatePadDummyBox = Box(-1,-yf,1,yf)
            gatePadDummyRect = Rect(self.metLayer,gatePadDummyBox)
            
            for key,value in self.gatePadDict.items():
                if value:
                    if key == 'TOP':
                        direction = NORTH
                    else:
                        direction = SOUTH
                    place(gatePad[self.gatePadDict.keys().index(key)], direction, gatePadDummyRect,0)
                    #con esto estiro los metales del gate hasta los pads
                    for i,layer in enumerate(self.gateLayers):
                        gateRect[i].expandDir(dir = direction,coord = 0.25)

            gatePadDummyRect.destroy()

    ###  PMOS PARAMETERS   ###
        if self.tranType == 'epm':
            fgAddEnclosingRects(self.makeGrouping(), self.encLayers)
            NWellRect = Rect(self.nWellLayer, self.makeGrouping().getBBox(self.tubLayer))

    ### TERMINALS ###
        #add the terminals for this transistor unit
        self.addTerm('S', TermType.INPUT_OUTPUT)    # source terminal
        self.addTerm('D', TermType.INPUT_OUTPUT)    # drain terminal
        self.addTerm('G', TermType.INPUT)           # gate terminal
        self.addTerm('B', TermType.INPUT_OUTPUT)    # bulk (substrate) terminal

        self.setTermOrder(['D', 'G', 'S', 'B'])
        #look up if there is a gate pad created, if not the pin is the gate rect, not the pad
        if self.gatePadDict['TOP'] or self.gatePadDict['BOT'] :
            gPin = []
            for key,value in self.gatePadDict.items():
                if value:
                    gPin.append(Pin('G'+str(key),'G'))
                    gPin[self.gatePadDict.keys().index(key)].addShape(gatePad[self.gatePadDict.keys().index(key)])
                else:
                    gPin.append(False)
        else:
            gPin = Pin('G', 'G')
            if self.gatePlate:
                gPin.addShape(gateRect[1])
            else:
                gPin.addShape(gateRect[0])

        #if there is no pad, diffusion extended over poly is the pin
        sPin = Pin('S', 'S')
        if self.sourcePad:
            sourceAbut = Rect(self.difLayer,sourceContact.getRefBox())
        else:
            left  = diffRect.left
            right = gateRect[0].left
            sourceBox = Box(left,-self.w/2 ,right,self.w/2)
            sourceRect = Rect(self.difLayer, sourceBox)
            sourceAbut = sourceRect

        sPin.addShape(sourceAbut)

        dPin = Pin('D', 'D')
        if self.drainPad:
            drainAbut = Rect(self.difLayer,drainContact.getRefBox())
        else:
            left = gateRect[0].right
            right = diffRect.right
            drainBox = Box(left,-self.w/2 ,right,self.w/2)
            drainRect = Rect(self.difLayer, drainBox)
            drainAbut = drainRect
        
        dPin.addShape(drainAbut)