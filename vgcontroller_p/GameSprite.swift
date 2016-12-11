//
//  GameSprite.swift
//  tttt
//
//  Created by Steve Yang on 2016/11/28.
//  Copyright © 2016年 Steve Yang. All rights reserved.
//
import SpriteKit


protocol TapAble {
    func onTap()
}


protocol GameSprite: TapAble {
    var textureAtlas: SKTextureAtlas {get set}
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize)
    func onTap()

}

