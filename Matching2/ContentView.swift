//
//  ContentView.swift
//  Matching2
//
//  Created by Dylan Kingsboro on 4/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    
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
                Text("👻").font(.largeTitle)
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
