//
//  Game.swift
//  LFCardGame
//
//  Created by milo on 16/8/18.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit
/**
 #### 类名：游戏类（业务模型）
 #### 作用：根据扑克牌，生成游戏的起始时需要的随机的纸牌，并且在用户点击时，能够完成纸牌的比对，计算分数
 #### 属性：存储所有随机出来的纸牌，使用数组 allRandomCards
 #### 方法：
 1. 游戏开始时，随机出本局的纸牌
 2. 当用户点击某个位置的纸牌后，根据制定的规则进行比对纸牌
 */
class Game: NSObject{
    ///增加一个属性记录分数
    var score: Int = 0
    ///创建用于存储随机纸牌的数组
    var allRandomCards :Array<Card>!
    /**
     #### 参数：
     - poker 要抽取的牌来自于那个扑克牌对象
     - count 要抽取的牌的个数
     */
    override init() {
        
    }
    init(poker: Poker, count: Int) {
        allRandomCards = Array()
        ///因为要抽取count张纸牌，所以做循环
        for _ in 0..<count {
            ///使用随机函数生成一个符合下标的整数
            let index = Int.random(0, poker.allCards.count)
            
            ///根据这个随机数，找到该位置的纸牌
            let card = poker.allCards[index]
            
            ///将随机出来的牌放在数组中
            self.allRandomCards.append(card)
            
            ///将随过的牌从poker中移除
            poker.allCards.removeAtIndex(index)
        }
    }
    
    /**
     ### 核心方法：根据传入的点击位置，比对纸牌
     */
    func tapCardAtIndex(index: NSInteger) {
        //拿到选中的牌
        let chooseCard = self.allRandomCards[index]
        if chooseCard.faceUp {
            chooseCard.faceUp = false
        }else{
            chooseCard.faceUp = true;
            for i in 0..<self.allRandomCards.count {
                if index != i {
                    let otherCard = self.allRandomCards[i]
                    ///其他牌 朝上 并且 没有被匹配
                    if otherCard.faceUp && !otherCard.matched {
                        if chooseCard.suit == otherCard.suit{//花色相同 成绩加1
                            chooseCard.matched = true
                            otherCard.matched = true
                            self.score += 1
                        }else if(chooseCard.rank == otherCard.rank){// 分数相同 成绩加4
                            chooseCard.matched = true
                            otherCard.matched = true
                            self.score += 4
                        }else{// 没有匹配 上一张 翻回
                            otherCard.faceUp = false
                        }
                    }
                }
            }
        }
    }
}
///对int进行扩展
public extension Int {
    public static func random(lower: Int = 0, _ upper: Int = Int.max) ->Int{
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}
