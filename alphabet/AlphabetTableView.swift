//
//  AlphabetTableView.swift
//  alphabet
//
//  Created by Dong on 6/9/2020.
//  Copyright © 2020 MAGICALBOY. All rights reserved.
//

import SwiftUI
import GridStack

struct AlphabetTableView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    ZStack {
      GridStack(minCellWidth: UIScreen.main.bounds.width/4, spacing: 20, numItems: 26, alignment: .leading) { index, cellWidth in
        ZStack {
          Path { path in
            path.move(to: CGPoint(x: 0, y: cellWidth/4*3/5))
            path.addLine(to: CGPoint(x: cellWidth, y: cellWidth/4*3/5))
            path.move(to: CGPoint(x: 0, y: cellWidth/4*3/5*2))
            path.addLine(to: CGPoint(x: cellWidth, y: cellWidth/4*3/5*2))
            path.move(to: CGPoint(x: 0, y: cellWidth/4*3/5*3))
            path.addLine(to: CGPoint(x: cellWidth, y: cellWidth/4*3/5*3))
            path.move(to: CGPoint(x: 0, y: cellWidth/4*3/5*4))
            path.addLine(to: CGPoint(x: cellWidth, y: cellWidth/4*3/5*4))
            path.move(to: CGPoint(x: 0, y: cellWidth/4*3/5*5))
            path.addLine(to: CGPoint(x: cellWidth, y: cellWidth/4*3/5*5))
          }
          .stroke(Color.blue.opacity(0.2), lineWidth: 2)
          HStack (alignment: .firstTextBaseline) {
            Text("\(String(UnicodeScalar(UInt8(65+index))))")
              .fontWeight(.bold)
              .font(.system(size: cellWidth/5*2))
              .baselineOffset(cellWidth/4*3/5)
            Text("\(String(UnicodeScalar(UInt8(97+index))))")
              .font(.system(size: cellWidth/5*2))
              .foregroundColor(.gray)
              .baselineOffset(cellWidth/4*3/5)
          }
        }
        .frame(width: cellWidth, height: cellWidth/4*3)
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

struct AlphabetTableView_Previews: PreviewProvider {
  static var previews: some View {
    AlphabetTableView()
  }
}
