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
            Text("This is your Jopet. Feed them correct foods to level them up and care for them").fontWeight(.ultraLight)
            TabView {
              JopetInfoView(jopet: self.nav.doge).background(Color.yellow).cornerRadius(20.0)
              JopetInfoView(jopet: self.nav.cate).background(Color.purple).cornerRadius(20.0)
              JopetInfoView(jopet: self.nav.birde).background(Color.orange).cornerRadius(20.0)
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
      Text(jopet.name + jopet.foodEaten.joined()).font(.system(size:25))
      Image(jopet.name.lowercased())
      Text("hp:\(jopet.hitPoints)").font(.system(size:20))
      Text("hunger: " + String(format: "%.1f", jopet.hunger)).font(.system(size:20))
      Text("level: \(jopet.level)").font(.system(size:20))
      Text(jopet.personality).font(.system(size:20))

    }.frame(height:400)
  }
}
