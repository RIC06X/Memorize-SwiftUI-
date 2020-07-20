//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yanjie Xu on 2020/7/17.
//  Copyright © 2020 Yanjie Xu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame{
    //private(set) var model: MemoryGame<String>
    //private(set): only EmojiMemoryGame can modify this property, other object which use this class can only see (read-only) this property
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame() //Name of the type, type member(the createMemoryGame function)
    
    //static func sending this function to the 'type' of the Class (functional programming), not the instance of the class (object oriented programming)
    static func createMemoryGame()-> MemoryGame<String> {
        let emojis: Array<String> = ["🌚","🌝","🌞","👻","😈","👏","🤥","😱"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { (pairIndex: Int) -> String in
            emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //Mark: - Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
