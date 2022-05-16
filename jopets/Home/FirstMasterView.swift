//
//  FirstMasterView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI


struct FirstMasterView: View {

   //  @Binding var navController: (selection: Int, FirstDetailIsShown: Bool, SecondDetailIsShown: Bool)
    
    @EnvironmentObject var nav: NavigationController
    
    
    var body: some View {
        NavigationView{
          
          VStack(spacing: 5){
            Text("This is your Pet. Feed them correct foods to level them up and care for them").fontWeight(.ultraLight)
            TabView {
				PetInfoView(pet: self.nav.doge).background(Color.yellow).cornerRadius(20.0)
				PetInfoView(pet: self.nav.cate).background(Color.purple).cornerRadius(20.0)
				PetInfoView(pet: self.nav.birde).background(Color.orange).cornerRadius(20.0)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))


                NavigationLink(destination: FirstDetailView(), isActive: self.$nav.tab1Detail1IsShown) {
                  Text("Inventory")
                  Image(systemName: "bag")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(8)
                

          }
        .navigationBarTitle(Text("Feed your Pet"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FirstMasterView_Previews: PreviewProvider {
    static var previews: some View {
        FirstMasterView()
          .environmentObject(NavigationController())
    }
}

struct PetInfoView: View {
  let pet: Pet
  var body: some View {
    VStack{
      Text(pet.name + pet.foodEaten.joined()).font(.system(size:25))
      Image(pet.name.lowercased())
      Text("hp:\(pet.hitPoints)").font(.system(size:20))
      Text("hunger: " + String(format: "%.1f", pet.hunger)).font(.system(size:20))
      Text("level: \(pet.level)").font(.system(size:20))
      Text(pet.personality).font(.system(size:20))

    }.frame(height:400)
  }
}
