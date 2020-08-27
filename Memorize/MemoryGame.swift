//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yanjie Xu on 2020/7/17.
//  Copyright © 2020 Yanjie Xu. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    //Since parms in functions are constans, (let) and are value type (copied), cannot modify or have effect on overall model
    //mutating here means: struct are value type, copy on modify, all functions changes struct (self) needs to notify struct (self) by add mutating in front of function
    mutating func choose(card: Card) {
        print("Card choosen \(card)")
        let choosenIndex: Int = index(of: card)
        self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp
    }
    
    // params dual lable name (external_name internal_name: var_type)
    func index(of card: Card) -> Int{
        for i in 0..<cards.count{
            if cards[i].id == card.id{
                return i
            }
        }
        return 0 //TODO: Bogus
    }
    //implicitly mutating, changing self, don't need additional mutating, since we are create self by setting variables.
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
        
    }
}
