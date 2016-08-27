//
//  Poker.swift
//  LFCardGame
//
//  Created by milo on 16/8/17.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit
/**
 #### 类名：扑克牌类（数据模型）
 #### 作用：存储一副扑克牌（不包含大小王）
 #### 属性：使用数组存储52个Card对象
 */
class Poker: NSObject{
    var allCards: Array<Card>
    override init() {
        allCards = Array<Card>()
        let allSuit = Card.allSuit()
        let allRank = Card.allRank()
        for suit: String in allSuit {
            for rank: String in allRank {
                let card: Card = Card(suit:suit, rank: rank)
                allCards.append(card)
            }
        }
    }
}
