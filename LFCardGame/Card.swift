//
//  Card.swift
//  LFCardGame
//
//  Created by milo on 16/8/14.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit
/**
 - 类名：纸牌类 属于数据模型
 - 作用：描述一张纸牌对象
 ### 属性：
 - 花色 suit
 - 大小 rank
 - 面朝上 faceUp
 - 是否匹配 matched
 */
class Card: NSObject {
    
    ///花色
    var suit: String?

    ///大小
    var rank: String?

    ///面朝上
    var faceUp = false
    
    ///是否匹配
    var matched = false
    
    ///增加一个属性，用于返回纸牌的牌面信息（花色+大小)
    var cardInfo: String {
        get{
            return self.suit!.stringByAppendingString(self.rank!)
        }
    }
    
    init(suit: String?, rank: String?) {
        super.init()
        self.suit = suit
        self.rank = rank
        
    }
    static func allSuit() -> Array<String>{
        return ["♠️","❤️","♣️","♦️"]
    }
    
    static func allRank() ->Array<String>{
        return ["A","2","3","4","5","6","7","8","9","10","J","Q","K"];
    }
}
