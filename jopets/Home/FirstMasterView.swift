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
            Text("This is your Jopet. Feed them correct foods to level them up and care for them").fontWeight(.ultraLight).font(.system(size:20))
            TabView {
              JopetInfoView(jopet: self.nav.doge).background(Color.yellow).cornerRadius(20.0)
              JopetInfoView(jopet: self.nav.cate).background(Color.purple).cornerRadius(20.0)
              JopetInfoView(jopet: self.nav.birde).background(Color.orange).cornerRadius(20.0)
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
      Text(jopet.name).font(.system(size:25))
      Image(jopet.name.lowercased()).font(.system(size:25))
      Text("hp:\(jopet.hitPoints)").font(.system(size:20))
      Text("hunger: " + String(format: "%.1f", jopet.hunger)).font(.system(size:20))
      Text("level: \(jopet.level)").font(.system(size:20))
      Text(jopet.personality).font(.system(size:20))
    }
  }
}
