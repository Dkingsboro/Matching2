//
//  ContentView.swift
//  Matching2
//
//  Created by Dylan Kingsboro on 4/14/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃","🕷️","👹","👹"]
    // [String] is the same as Array<String> . Once again that inference from Swift
    // You can ALSO let it be let emojis: [blah blah blah] to REALLY let Swift infer

    var body: some View {
        HStack 
        {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
            // A Range of Integers that goes from 0 up to but not including 4
        }
        .foregroundColor(.orange)
        .padding()
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
