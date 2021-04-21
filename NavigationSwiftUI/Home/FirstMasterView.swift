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
          
          VStack{
            Text("This is your Jopet. Feed them correct foods to level them up and care for them").fontWeight(.ultraLight)
            TabView {
              JopetInfoView(jopet: self.nav.doge)
              JopetInfoView(jopet: self.nav.cate)
              JopetInfoView(jopet: self.nav.birde)
                    }
                    .tabViewStyle(PageTabViewStyle())


                NavigationLink(destination: FirstDetailView(), isActive: self.$nav.tab1Detail1IsShown) {
                  Text("Inventory")
                  Image(systemName: "bag")
                }
            }
        .navigationBarTitle(Text("Feed your Jopet"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FirstMasterView_Previews: PreviewProvider {
    static var previews: some View {
        FirstMasterView()
          .environmentObject(NavigationController())
    }
}

struct JopetInfoView: View {
  let jopet: Jopet
  var body: some View {
    VStack{
      Text(jopet.name)
      Image(jopet.name.lowercased())
      Text("hp:\(jopet.hitPoints)")
      Text("hunger: " + String(format: "%.1f", jopet.hunger))
      Text("level: \(jopet.level)")
      Text(jopet.personality)
    }
  }
}
