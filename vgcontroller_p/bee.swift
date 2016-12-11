//
//  bee.swift
//  tttt
//
//  Created by Steve Yang on 2016/11/28.
//  Copyright © 2016年 Steve Yang. All rights reserved.
//

import SpriteKit

class Bee: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "bee")
    var flyAnimation: [SKAction]? = nil
    var direction: Int = 1
    var nodeX: CGFloat = 0
    var nodeY: CGFloat = 0
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width:56, height:48 )) {
        parentNode.addChild(self)
        self.flyAnimation = createAnimation()
        self.size = size
        self.position = position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        for action in self.flyAnimation! {
            self.run(action)
        }
    }
    
    func setDirection(dir: Int) {
        self.direction = dir
    }
    
    func createAnimation()-> [SKAction] {
        let frames: [SKTexture] = [textureAtlas.textureNamed("bee"), textureAtlas.textureNamed("bee_fly")]
        let action1 = SKAction.animate(with: frames, timePerFrame: 0.5)
        let targetLeft = CGFloat(self.direction*(-200))
        let targetRight = CGFloat(self.direction*(200))
    
        
        let pathLeft = SKAction.moveBy(x: targetLeft, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: targetRight, y: 10, duration: 2)
        // We will use these to turn the bee to face left and right
        let flipTextureNegative = SKAction.scaleX(to: CGFloat(-1*self.direction), duration: 0)
        let flipTexturePositive = SKAction.scaleX(to: CGFloat(1*self.direction), duration: 0)
        // Combine actions into a cohesive flight sequence for our bee
        let action2 = SKAction.sequence([pathLeft,
                                                flipTextureNegative, pathRight, flipTexturePositive])
        
        
        self.physicsBody?.applyImpulse(CGVector(dx: -5, dy: 0))
        self.physicsBody?.mass = 0.2
        return [SKAction.repeatForever(action1), SKAction.repeatForever(action2)]
    }
    
    func onTap() {
        print ("bee is onTap")
        self.xScale = 4
        self.yScale = 4
        
    }
}

class HeroBee: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "bee")
    var flyAnimation: [SKAction]? = nil
    var direction: Int = 1
    var nodeX: CGFloat = 0
    var nodeY: CGFloat = 0
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width:56, height:48 )) {
        parentNode.addChild(self)
        self.flyAnimation = createAnimation()
        self.size = size
        self.position = position
        
        //self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        //self.physicsBody?.affectedByGravity = false
        for action in self.flyAnimation! {
            self.run(action)
        }
    }
    
    func createAnimation()-> [SKAction] {
        let frames: [SKTexture] = [textureAtlas.textureNamed("bee"), textureAtlas.textureNamed("bee_fly")]
        let action1 = SKAction.animate(with: frames, timePerFrame: 0.5)
        
        
        //self.physicsBody?.applyImpulse(CGVector(dx: -5, dy: 0))
        //self.physicsBody?.mass = 0.2
        return [SKAction.repeatForever(action1)]
    }
    
    func onTap() {
        print ("bee is onTap")
    }
}
