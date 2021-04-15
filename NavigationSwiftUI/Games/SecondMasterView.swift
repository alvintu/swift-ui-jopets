//
//  SecondMasterView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI
import SpriteKit

struct SecondMasterView: View {
  @EnvironmentObject var nav: NavigationController

    var body: some View {
      
        NavigationView{
            VStack{
              Text("Answer math questions to earn jocoins").fontWeight(.ultraLight)
              Text("What is:")
              Text(self.nav.equation)
              Text(self.nav.entry).onChange(of: self.nav.entry, perform: { value in
                if self.nav.answer == self.nav.entry {
                  self.nav.entry = ""
                  self.nav.jocoins += 10
                  self.nav.setUpEquation()
                  
                }
                if self.nav.entry.count > 2 {
                  self.nav.entry = ""
                }
              })
//              TextField("Enter your PIN", text: self.$nav.pin)
//                  .frame(width:300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                  .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//                  .foregroundColor(.blue)
//                  .minimumScaleFactor(0.5)
              

                  
              VStack(spacing:10) {
                  HStack{
                      CircleButton(title: "1") {
                        self.nav.entry.append("1")
                      }
                      CircleButton(title: "2") {
                        self.nav.entry.append("2")
                      }
                      CircleButton(title: "3") {
                        self.nav.entry.append("3")
                      }
                 
                  }
                  HStack{
                      CircleButton(title: "4") {
                        self.nav.entry.append("4")
                      }
                      CircleButton(title: "5") {
                        self.nav.entry.append("5")
                      }
                      CircleButton(title: "6") {
                        self.nav.entry.append("6")
                      }
                 
                  }
                  HStack{
                      CircleButton(title: "7") {
                        self.nav.entry.append("7")
                      }
                      CircleButton(title: "8") {
                        self.nav.entry.append("8")
                      }
                      CircleButton(title: "9") {
                        self.nav.entry.append("9")
                      }
                 
                  }
                  
                  HStack{
                      CircleButton(title: "0") {
                        self.nav.entry.append("0")
                      }
                 
                  }
              }
              
                NavigationLink(destination: SecondDetailView(), isActive: $nav.tab2Detail1IsShown) {
                        Text("earn fast jocoins")
                }
                
            }
                
            .navigationBarTitle(Text("jocoins: \(self.nav.jocoins)"))
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear(perform: {
          self.nav.setUpEquation()
        })
    }
  

  }





struct CircleButton: View {
    var title:String
    var action = {}

    var body: some View {
        Button(action: {
            
                self.action()

            
        }, label: {
            Text(title)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                )
        })
    }
    

}

