//
//  FirstDetailView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

enum JopetType {
  case Doge
  case Cate
  case Birde
}

struct FirstDetailView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @EnvironmentObject var nav: NavigationController
  @State private var showingSheet = false
  @State private var jopetType: JopetType = .Doge
  @State private var inventoryIndex: Int = 0
  @State private var selectedEmoji: String = ""

  
  let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
  
  var body: some View {
    
    VStack(spacing: 20) {

      Text("Inventory: \(self.nav.inventory.count)").fontWeight(.ultraLight)
      
      
      
      let columns = [
        GridItem(.adaptive(minimum: 100))
      ]
      
      let data = self.nav.inventory
      
      ScrollView {
        LazyVGrid(columns: columns, spacing: 5) {
          ForEach(Array(zip(data.indices,data )), id: \.0) { index, item in
            Button(action: {
                    inventoryIndex = index
                    selectedEmoji = item.emoji
                    print(item.name)
                    showingSheet = true})
            {
              InventoryItemView(showingSheet: $showingSheet, jopetType:$jopetType,inventoryIndex: $inventoryIndex, emoji: item.emoji, name: item.name) {

                switch jopetType {
                case .Doge:
                  self.nav.doge.foodEaten.append(selectedEmoji)
                  self.nav.doge.hunger += 0.2
                  self.nav.doge.level += 1
                case .Cate:
                  self.nav.cate.foodEaten.append(selectedEmoji)
                  self.nav.cate.hunger += 0.2
                  self.nav.cate.level += 1

                case .Birde:
                  self.nav.birde.foodEaten.append(selectedEmoji)
                  self.nav.birde.hunger += 0.2
                  self.nav.birde.level += 1
                }
                let itemIndex = self.nav.inventory.firstIndex(where: {$0.emoji == selectedEmoji})
                self.nav.inventory.remove(at: itemIndex!)
                
                print(self.nav.inventory)
                self.presentationMode.wrappedValue.dismiss()


              }
            }
            
          }
          .padding(.horizontal)
        }
        
        Text("Shopping List")
        Text(self.nav.data).font(.body).border(Color.black).multilineTextAlignment(.center)


        HStack(spacing: 50){
          NavigationLink(destination: FirstTabLastView(), isActive: self.$nav.tab1Detail2IsShown) {
            Text("earn jocoins")
          }
          Button(action: {
            self.nav.tab1Detail1IsShown = false
            self.nav.tab2Detail1IsShown = false
            self.nav.selection = 1
          }) { Text("Games")
          }
        }
      }
      .navigationBarBackButtonHidden(true) // not needed, but just in case
      .navigationBarItems(leading: MyBackButton(label: "Back") {
        self.nav.tab1Detail1IsShown = false
        
      })
      
    }
  }
  
  

  
  struct InventoryItemView: View {
    @Binding var showingSheet: Bool
    @Binding var jopetType: JopetType
    @Binding var inventoryIndex: Int
    @State var emoji: String
    @State var name: String
    var action = {}
    
    var body: some View {
      VStack {
        Text(emoji).font(.system(size: 100))
        Text(name).fontWeight(.ultraLight)
      }
      .actionSheet(isPresented: $showingSheet) {
        ActionSheet(
          title: Text("Feed your pet \(emoji)"),
          message: Text("There's only one choice..."),
          buttons: [.default(Text("Feed Doge"))
                      {
                        print("doge")
                        self.jopetType = .Doge
                        self.action()

                        
                      },
                    .default(Text("Feed Cate")){
                      self.jopetType = .Cate

                      self.action()


                    },
                    .default(Text("Feed Birde")){
                      self.jopetType = .Birde
                      self.action()

                    },
                    .default(Text("Dismiss"))]
        )
      }
    }
  }
}
