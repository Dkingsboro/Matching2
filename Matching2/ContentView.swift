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
            cards
            cardCountAdjusters
        }
        .padding() // Padding for buttons & cards
    }
    
    
    
    var cards: some View {
        HStack // Horizontal Card Stack
        {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
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
    
    var cardRemover: some View{
        Button(action: { // Button to subtract cards using stack icon
            if cardCount > 1
            {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: { // Button to add cards using stack icon
            if cardCount < emojis.count
            {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
        })
    }
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
            if isFaceUp
            {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else 
            {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
