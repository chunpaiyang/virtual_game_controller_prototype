//
//  bee.swift
//  tttt
//
//  Created by Steve Yang on 2016/11/28.
//  Copyright © 2016年 Steve Yang. All rights reserved.
//

import SpriteKit

class ControlNode: SKShapeNode{
    var isTouched: Bool = false
    var unTouchList: [ControlNode]? = nil
    func SetControlNode(node: SKSpriteNode) {
    }
    
    func SetTouch() {
        isTouched = true
        
    }
    
    func SetUnTouchListWhenSetTouch(list: [ControlNode]) {
        self.unTouchList = list
    }
    
    func SetUnTouch() {
        isTouched = false
        
    }
}

class ControlButtonLeft: ControlNode, TapAble {
    func onTap() {
        print ("CL is onTap")
    }
}

class ControlButtonRight: ControlNode, TapAble {
    func onTap() {
        print ("CR is onTap")
    }
}

class ControlButtonUp: ControlNode, TapAble {
    func onTap() {
        print ("Cu is onTap")
    }
}
class ControlButtonDown: ControlNode, TapAble {
    func onTap() {
        print ("CD is onTap")
    }
}

class ControlPanel {
    var scene: SKScene? = nil
    var node: SKSpriteNode? = nil
    var cl: ControlButtonLeft? = nil
    var cr: ControlButtonRight? = nil
    var cu: ControlButtonUp? = nil
    var cd: ControlButtonDown? = nil
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func SetControl(node: SKSpriteNode) {
        self.node = node
        
        self.cu?.SetControlNode(node:node)
        self.cd?.SetControlNode(node:node)
        self.cr?.SetControlNode(node:node)
        self.cl?.SetControlNode(node:node)
    }
    
    func SetUntouch() {
        cl?.SetUnTouch()
        cr?.SetUnTouch()
        cu?.SetUnTouch()
        cd?.SetUnTouch()
    }
    
    func Create() {
        let r = CGFloat(50.0)
        let x = CGFloat(-260)
        let y = CGFloat(-100)
        let gap = CGFloat(10)
        
        cl = ControlButtonLeft(circleOfRadius: r)
        cr = ControlButtonRight(circleOfRadius: r)
        cu = ControlButtonUp(circleOfRadius: r)
        cd = ControlButtonDown(circleOfRadius: r)
        
        cl?.SetUnTouchListWhenSetTouch(list: [cr!, cu!, cd!])
        cr?.SetUnTouchListWhenSetTouch(list: [cl!, cu!, cd!])
        cu?.SetUnTouchListWhenSetTouch(list: [cl!, cr!, cd!])
        cd?.SetUnTouchListWhenSetTouch(list: [cl!, cr!, cu!])
        
        cu?.position = CGPoint(x: x, y: (y + r) + gap)
        cd?.position = CGPoint(x: x, y: y - r - gap)
        cl?.position = CGPoint(x: x - r - gap , y: y)
        cr?.position = CGPoint(x: x + r + gap, y: y)
        
        scene?.addChild(cl!)
        scene?.addChild(cr!)
        scene?.addChild(cu!)
        scene?.addChild(cd!)
    }
}
