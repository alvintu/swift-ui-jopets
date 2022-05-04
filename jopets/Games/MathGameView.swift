//
//  SecondMasterView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct MathGameView: View {
	@EnvironmentObject var nav: NavigationController
	@StateObject var viewModel: MathGameView.ViewModel




    var body: some View {
      
        NavigationView{
            VStack{
              Text("Answer math questions to earn jocoins").fontWeight(.ultraLight).font(.system(size:20))
              Text("What is:")
				Text(self.viewModel.equation)
				Text(self.viewModel.entry)
				Text(self.viewModel.answer)

              VStack(spacing:10) {
                  HStack{
                      CircleButton(title: "1") {
                        self.viewModel.entry.append("1")
                      }
                      CircleButton(title: "2") {
                        self.viewModel.entry.append("2")
                      }
                      CircleButton(title: "3") {
                        self.viewModel.entry.append("3")
                      }
                 
                  }
                  HStack{
                      CircleButton(title: "4") {
                        self.viewModel.entry.append("4")
                      }
                      CircleButton(title: "5") {
                        self.viewModel.entry.append("5")
                      }
                      CircleButton(title: "6") {
                        self.viewModel.entry.append("6")
                      }
                 
                  }
                  HStack{
                      CircleButton(title: "7") {
                        self.viewModel.entry.append("7")
                      }
                      CircleButton(title: "8") {
                        self.viewModel.entry.append("8")
                      }
                      CircleButton(title: "9") {
                        self.viewModel.entry.append("9")
                      }
                 }
                  HStack{
                      CircleButton(title: "0") {
                        self.viewModel.entry.append("0")
                      }
                 
                  }
              }
              
                NavigationLink(destination: SecondDetailView(), isActive: $nav.tab2Detail1IsShown) {
                        Text("earn more")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.yellow)
                .cornerRadius(8)

                
            }
                
            .navigationBarTitle(Text("jocoins: \(self.nav.jocoins)"))
        }.navigationViewStyle(StackNavigationViewStyle())
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
                .frame(width: 80, height: 80)
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                )
        })
    }
    

}

