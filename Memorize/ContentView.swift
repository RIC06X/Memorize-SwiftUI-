//
//  ContentView.swift
//  Memorize
//
//  Created by Yanjie Xu on 2020/7/16.
//  Copyright © 2020 Yanjie Xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
        .font(viewModel.cards.count/2 < 5 ? .largeTitle:.body)
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View{
        return ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }

        }.aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel:  EmojiMemoryGame())
    }
}
