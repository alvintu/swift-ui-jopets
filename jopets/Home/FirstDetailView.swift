//
//  FirstDetailView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

enum PetType {
  case Dog
  case Cat
  case Bird
}

struct FirstDetailView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @EnvironmentObject var nav: NavigationController
  @State private var showingSheet = false
  @State private var petType: PetType = .Dog
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
                    showingSheet = true})
            {
              InventoryItemView(showingSheet: $showingSheet, petType:$petType,inventoryIndex: $inventoryIndex, emoji: item.emoji, name: item.name) {

                switch petType {
                case .Dog:
                  self.nav.doge.foodEaten.append(selectedEmoji)
                  self.nav.doge.hunger += 0.2
                  self.nav.doge.level += 1
                case .Cat:
                  self.nav.cate.foodEaten.append(selectedEmoji)
                  self.nav.cate.hunger += 0.2
                  self.nav.cate.level += 1

                case .Bird:
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
    @Binding var petType: PetType
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
                        self.petType = .Dog
                        self.action()

                        
                      },
                    .default(Text("Feed Cate")){
                      self.petType = .Cat

                      self.action()


                    },
                    .default(Text("Feed Birde")){
                      self.petType = .Bird
                      self.action()

                    },
                    .default(Text("Dismiss"))]
        )
      }
    }
}
