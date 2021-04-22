//
//  ThirdMasterView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

struct ThirdMasterView: View {
  
  
  @EnvironmentObject var nav: NavigationController
  
  var body: some View {
    
    GeometryReader { geometry in
      
      NavigationView{
        VStack{
          Text("Spend your jocoins on foods your jopet loves").fontWeight(.ultraLight)
          Text("Inventory: \(self.nav.inventory.count)").fontWeight(.light)

          let columns = [
            GridItem(.adaptive(minimum: 100))
          ]
          
          let data = self.nav.foodDictionary
          
          ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
              ForEach(data.sorted(by: >), id: \.key) { key, value in
                Button(action:{
                  if self.nav.jocoins > 0 {
                    self.nav.jocoins -= 10
                    
                    let item = InventoryItem(emoji: key, name: value)
                    self.nav.inventory.append(item)
                  }
                })
                {
                  ShopItem(key: key, value: value)
                }
              }
            }
            .padding(.horizontal)
          }
          .frame(maxHeight: geometry.size.height)
        }
        .navigationBarTitle(Text("jocoins: \(self.nav.jocoins)"))
      }.navigationViewStyle(StackNavigationViewStyle())
    }
  }
}


struct ShopItem: View {
  var key: String
  var value: String
  var body: some View {
    VStack {
      Text(key).font(.system(size: 100))
      Text(value).fontWeight(.ultraLight)
    }
  }
}
