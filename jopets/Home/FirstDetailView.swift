//
//  FirstDetailView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

struct FirstDetailView: View {
  
  @EnvironmentObject var nav: NavigationController
  
  let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
  
  var body: some View {
    
    VStack(spacing: 20) {
      Text("Inventory: \(self.nav.inventory.count)").fontWeight(.ultraLight)

      
      Text(self.nav.data).font(.body).padding().border(Color.black)
      
      
      let columns = [
        GridItem(.adaptive(minimum: 100))
      ]
      
      let data = self.nav.inventory
      
      ScrollView {
        LazyVGrid(columns: columns, spacing: 5) {
          ForEach(data, id: \.id) { item in
            Button(action: {
              if self.nav.jocoins > 0 {
                //                        self.nav.jocoins -= 1
                //                          let item = InventoryItem(emoji: key, name: "value")
                //                          print(key, value)
                //                        self.nav.inventory.append(item)
              }
            }) {
              VStack {
                Text(item.emoji).font(.system(size: 100))
                Text(item.name).fontWeight(.ultraLight)
              }
              
            }
            
          }
          
        }
        .padding(.horizontal)
      }
      
      
      HStack(spacing: 50){
        NavigationLink(destination: FirstTabLastView(), isActive: self.$nav.tab1Detail2IsShown) {
          Text("watch ads \nfor jocoins")
        }
        Button(action: {
          self.nav.tab1Detail1IsShown = false
          self.nav.tab2Detail1IsShown = false
          self.nav.selection = 1
        }) { Text("Games")
        }
      }
    }
    
    
    
    
    //always call from one stackview above, which is the right event to further collapse navStack
    //get notified when view is dissmised
    //            .onReceive(self.nav.$tab1Detail2IsShown, perform: { (out) in
    //                print("recieve goToRootController: \(self.nav.goToRootController) with detail \(self.nav.tab1Detail1IsShown.description) and detail \(self.nav.tab1Detail2IsShown.description)")
    //                if self.nav.tab1Detail2IsShown ==  false && self.nav.tab1Detail1IsShown == true && self.nav.goToRootController == true {
    //                    print("collapse stack")
    //                    self.nav.tab1Detail1IsShown = false
    //                }
    //
    //                if !self.nav.tab1Detail2IsShown && !self.nav.tab1Detail1IsShown && self.nav.goToRootController {
    //                    print("finished collapsing")
    //                    self.nav.goToRootController = false
    //                }
    //            })
    
    //   workaround problem with back button
    .navigationBarBackButtonHidden(true) // not needed, but just in case
    .navigationBarItems(leading: MyBackButton(label: "Back") {
      self.nav.tab1Detail1IsShown = false
      
    })
    
  }
}


struct MyBackButton: View {
  let label: String
  let closure: () -> ()
  
  var body: some View {
    Button(action: { self.closure() }) {
      HStack {
        Image(systemName: "chevron.left")
        Text(label)
      }
    }
  }
}
