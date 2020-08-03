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
    
    mutating func choose(card: Card) {
        print("Card choosen \(card)")
        let choosenIndex: Int = index(of: card)
        self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int{
        for i in 0..<cards.count{
            if cards[i].id == card.id{
                return i
            }
        }
        return 0 //TODO: Bogus
    }
    
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
