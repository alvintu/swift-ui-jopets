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

	mutating var entry = ""
	
	var firstValue = 0, secondValue = 0
	var answer = "", equation = ""
	
//	var setUpEquation : Bool {
//		firstValue = randomInt()
//		secondValue = randomInt()
//		equation = equation(int1: firstValue, int2: secondValue)
//		answer = answer(int1:firstValue, int2: secondValue)
//
//		return equation == answer
//
//	}()
	
	func equation(int1: Int, int2: Int) -> String{
		return "\(int1) + \(int2)"
	}
	
	func answer(int1: Int, int2: Int) -> String{
		return String(int1 + int2)
	}
	
	func randomInt() -> Int{
		return Int.random(in: 100 ... 400)
		
	}


    var body: some View {
      
        NavigationView{
            VStack{
              Text("Answer math questions to earn jocoins").fontWeight(.ultraLight).font(.system(size:20))
              Text("What is:")
              Text(self.equation)
              Text(self.entry).onChange(of: self.entry, perform: { value in
                if self.answer == self.entry {
                  self.entry = ""
                  self.nav.jocoins += 10
//                  self.setUpEquation()
                  
                }
                if self.entry.count > 2 {
                  self.entry = ""
                }
              })
                  
              VStack(spacing:10) {
                  HStack{
                      CircleButton(title: "1") {
                        self.entry.append("1")
                      }
                      CircleButton(title: "2") {
                        self.entry.append("2")
                      }
                      CircleButton(title: "3") {
                        self.entry.append("3")
                      }
                 
                  }
                  HStack{
                      CircleButton(title: "4") {
                        self.entry.append("4")
                      }
                      CircleButton(title: "5") {
                        self.entry.append("5")
                      }
                      CircleButton(title: "6") {
                        self.entry.append("6")
                      }
                 
                  }
                  HStack{
                      CircleButton(title: "7") {
                        self.entry.append("7")
                      }
                      CircleButton(title: "8") {
                        self.entry.append("8")
                      }
                      CircleButton(title: "9") {
                        self.entry.append("9")
                      }
                 }
                  HStack{
                      CircleButton(title: "0") {
                        self.entry.append("0")
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
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear(perform: {
//          self.setUpEquation()
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
                .frame(width: 80, height: 80)
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                )
        })
    }
    

}

