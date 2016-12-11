//
//  GameScene.swift
//  tttt
//
//  Created by Steve Yang on 2016/11/17.
//  Copyright © 2016年 Steve Yang. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    let world = SKNode()
    let hero = HeroBee()
    var cp: ControlPanel?
    
    var blTouched: Bool = false
    
    override func didSimulatePhysics() {
    }
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue:
            0.95, alpha: 1.0)
        

        self.addChild(world)
        hero.spawn(parentNode: world, position: CGPoint(x: -0, y: -180))
        self.addControlPanel(scene: self, node: hero)
    }
    
    func addControlPanel(scene: SKScene, node: SKSpriteNode) {
        self.cp = ControlPanel(scene: scene);
        self.cp!.Create()
        self.cp!.SetControl(node: node)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches as! Set<UITouch>) {
            // Find the location of the touch:
            let location = touch.location(in: self)
            
            let date = Date()
            let calendar = Calendar.current
            
            let seconds = calendar.component(.second, from: date)
            
            print ("touch begin at \(location) seconds=\(seconds)")
            // Locate the node at this location:
            let nodeTouched = atPoint(location)
            // Attempt to downcast the node to the GameSprite protocol
            if let gameSprite = nodeTouched as? ControlNode {
                // If this node adheres to GameSprite, call onTap:
                gameSprite.SetTouch()
                
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        cp?.SetUntouch()
        for touch in (touches as! Set<UITouch>) {
            // Find the location of the touch:
            let location = touch.location(in: self)
            
            let date = Date()
            let calendar = Calendar.current
            
            let seconds = calendar.component(.second, from: date)
            
            print ("touch begin at \(location) seconds=\(seconds)")
            // Locate the node at this location:
            let nodeTouched = atPoint(location)
            // Attempt to downcast the node to the GameSprite protocol
            if let gameSprite = nodeTouched as? ControlNode {
                // If this node adheres to GameSprite, call onTap:
                gameSprite.SetTouch()
                
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches as! Set<UITouch>) {
            // Find the location of the touch:
            let location = touch.location(in: self)
            
            let date = Date()
            let calendar = Calendar.current
            
            let seconds = calendar.component(.second, from: date)
            
            print ("touch ends at \(location) seconds=\(seconds)")
            cp?.SetUntouch()
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if self.cp != nil {
            if (self.cp?.cl?.isTouched)! {
                self.hero.position = CGPoint(x:self.hero.position.x - 1, y:self.hero.position.y)
            } else if (self.cp?.cr?.isTouched)! {
                self.hero.position = CGPoint(x:self.hero.position.x + 1, y:self.hero.position.y)
            } else if (self.cp?.cu?.isTouched)! {
                self.hero.position = CGPoint(x:self.hero.position.x, y:self.hero.position.y + 1)
            } else if (self.cp?.cd?.isTouched)! {
                self.hero.position = CGPoint(x:self.hero.position.x, y:self.hero.position.y - 1)
            }
        }
    }
}

