//
//  HomeView.swift
//  alphabet
//
//  Created by Dong on 6/9/2020.
//  Copyright © 2020 MAGICALBOY. All rights reserved.
//

import SwiftUI

enum LearnModel {
  case learn
  case view
  case test
}

struct HomeView: View {
  @State private var action: Int? = 0
  
  var body: some View {
     NavigationView {
      VStack {
        NavigationLink(destination: AlphabetTableView(), tag: 1, selection: $action) {
          EmptyView()
        }
        NavigationLink(destination: ContentView(learnModel: .view), tag: 2, selection: $action) {
          EmptyView()
        }
        Spacer()
        Text("ABC Learning")
          .fontWeight(.bold)
          .font(.title)
        Spacer()
        Button(action: {
           self.action = 1
        }) {
          HStack {
              Image(systemName: "book.fill")
                .font(.title)
              Text("学")
                .fontWeight(.semibold)
                .font(.title)
          }
        }
        .buttonStyle(MainButtonStyle(color: .blue))
        Button(action: {
          self.action = 2
        }) {
          HStack {
              Image(systemName: "eye.fill")
                .font(.title)
              Text("认")
                .fontWeight(.semibold)
                .font(.title)
          }
        }
        .buttonStyle(MainButtonStyle(color: .purple))
        Button(action: {
          
        }) {
          HStack {
            Image(systemName: "flag.fill")
              .font(.title)
            Text("测")
              .fontWeight(.semibold)
              .font(.title)
          }
        }
        .buttonStyle(MainButtonStyle(color: .green))
        Spacer()
      }
     .navigationBarHidden(true)
    }
  }
}

struct MainButtonStyle: ButtonStyle {
  var color: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(40)
            .padding(10)
            .overlay(
              RoundedRectangle(cornerRadius: 40)
                .stroke(color, lineWidth: 5)
            )
          .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
