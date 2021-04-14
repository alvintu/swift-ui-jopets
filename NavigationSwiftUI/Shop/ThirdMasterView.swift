//
//  ThirdMasterView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

struct ThirdMasterView: View {
    
    @State var navController = (selection: 1, firstDetailIsShown: false, secondDetailIsShown: false)
    
  @EnvironmentObject var nav: NavigationController

    
    var body: some View {
      GeometryReader { geometry in

            NavigationView{
                VStack{
                  Text("Spend your jocoins on foods your jopet loves").fontWeight(.ultraLight)
                  Text("jocoins: \(self.nav.jocoins)").fontWeight(.ultraLight)
    
//                  let data = (1...100).map { "Item \($0)" }
                  
                  let columns = [
                      GridItem(.adaptive(minimum: 100))
                  ]
                  
                  let data = self.nav.foodDictionary

                      ScrollView {
                          LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(data.sorted(by: >), id: \.key) { key, value in
                              Button(action: {
                                if self.nav.jocoins > 0 {
                                self.nav.jocoins -= 1
                                  let item = InventoryItem(emoji: key, name: value)
                                  print(key, value)
                                self.nav.inventory.append(item)
                                }
                                }) {
                                VStack {
                                  Text(key).font(.system(size: 100))
                                  Text(value).fontWeight(.ultraLight)
                                }
                                  
                                }
                             
                              }
                          
                          }
                          .padding(.horizontal)
                      }
                      .frame(maxHeight: geometry.size.height)
                  
//                  Spacer()
                    
//                    Text("use tupel to collect all the view isShown states and pass it as input parameter").lineLimit(3)
                 
                    
//                    NavigationLink(destination: ThirdDetailView(navController: self.$navController), isActive: $navController.firstDetailIsShown) {
//                            Text("go to detail")
//                    }
                    
                }
                    
                .navigationBarTitle(Text("Spend Jocoins"))
            }.navigationViewStyle(StackNavigationViewStyle())
    }
    }
}

