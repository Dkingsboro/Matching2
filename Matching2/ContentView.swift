//
//  ContentView.swift
//  Matching2
//
//  Created by Dylan Kingsboro on 4/14/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃","🕷️","👹","💀","🕸️","🧙","🧟","🍬","🦇","🐈‍⬛","🧛"]
    // [String] is the same as Array<String> . Once again that inference from Swift
    // You can ALSO let it be let emojis: [blah blah blah] to REALLY let Swift infer
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding() // Padding for buttons & cards
    }
    
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) // Horizontal Card Stack
        {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange) // Making ONLY cards orange
    }
    
    var cardCountAdjusters: some View {
        HStack // Horizontal Button Stack
        {
            cardRemover
            Spacer() // Spacer between icons
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        
    }
    
    func cardCountAdjuster(by offset: Int, Symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: Symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, Symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, Symbol: "rectangle.stack.badge.plus")
    }
    
    struct CardView: View {
        let content: String
        @State var isFaceUp: Bool = true
        
        var body: some View
        {
            ZStack
            {
                let base = RoundedRectangle(cornerRadius: 12)
                // Let is used as a CONST variable type. It DOES NOT CHANGE
                // ALSO Swift will infer the type of struct like Rounded Rectangle. You do NOT have to tell it.
                // Option + click give you the struct type
                Group
                {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
                
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
}
    #Preview {
        ContentView()
    }

