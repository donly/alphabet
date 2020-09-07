//
//  ContentView.swift
//  alphabet
//
//  Created by Dong on 19/8/2020.
//  Copyright © 2020 MAGICALBOY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  
  init(learnModel: LearnModel = .learn) {
    self.learnModel = learnModel
  }
  
  var learnModel: LearnModel
  @State private var alphabet = "A"
  private let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  @State private var isPronouce = false
  private let colors: [Color] = [.orange, .red, .yellow, .green, .blue, .purple, .white, .gray]
  private let truefalse = [true, false]
  let pronouncer = WordPronouncer()
  
    var body: some View {
      ZStack {
        colors.randomElement()!
          .opacity(0.4)
          .edgesIgnoringSafeArea(.all)
        Circle().strokeBorder(colors.randomElement()!, lineWidth: 30)
          .aspectRatio(contentMode: .fit)
          .overlay(Text(truefalse.randomElement()! ? alphabet : alphabet.lowercased()).foregroundColor(colors.randomElement()!).font(.system(size: 500)).minimumScaleFactor(0.01)
            .shadow(radius: 4)
            .padding()
        )
          .edgesIgnoringSafeArea(.all)
          .padding()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
//          .background(colors.randomElement()!)
          .onTapGesture {
            if !self.isPronouce {
              self.pronouncer.pronounce(self.alphabet.lowercased())
              self.isPronouce = true
            }
            else {
              self.alphabet = self.alphabets.randomElement()!
              self.isPronouce = false
            }
          }
        VStack {
          Spacer()
          HStack {
            Spacer()
            Button(action: {
              self.presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "return")
                .padding()
                .foregroundColor(.white)
                .frame(width: 64)
                .background(Color.red)
                .cornerRadius(40)
            }
            .padding()
          }
        }
      }
      .navigationBarHidden(true)
      .navigationBarTitle("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(learnModel: .learn)
    }
}
