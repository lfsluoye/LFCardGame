//
//  GameViewController.swift
//  LFCardGame
//
//  Created by milo on 16/8/14.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    let poker = Poker()
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.game = Game(poker: self.poker, count: self.allButtons.count)
        self.showCardsInfo()
    }
    ///将game中的allRandomCards数据对应位置显示到按钮上
    func showCardsInfo(){
    //遍历每一个按钮，根据按钮的位置，找到于此位置对应的card对象将此对象的花色和大小，显示到按钮的title上
        for i in 0..<self.allButtons.count {
            let card = self.game.allRandomCards[i]
            let button = self.allButtons[i]
            
            button.setTitle(self.buttonTitleByCard(card), forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage.init(named: self.buttonImageNamebyCard(card)), forState: .Normal)
            button.enabled = !card.matched
        }
        self.scoreLabel.text = "\(self.game.score)"
    }
    @IBAction func clickCardButton(sender: UIButton) {
        let index = self.allButtons.indexOf(sender)
        self.game.tapCardAtIndex(index!)
        self.showCardsInfo()
    }
    
    func buttonTitleByCard(card: Card) -> String {
        return card.faceUp ? card.cardInfo : ""
    }
    
    func buttonImageNamebyCard(card: Card) -> String {
        return card.faceUp ? "cardfront.png" : "cardback.png"
    }

}
