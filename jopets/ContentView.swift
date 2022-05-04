//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var selection = 0
//
//    @State var navController = (selection: 1, FirstDetailIsShown: false, SecondDetailIsShown: false)
    
    @EnvironmentObject var nav: NavigationController

    var body: some View {
        
        //IMPORTANT: need self.
        TabView(selection: self.$nav.selection){
            
            FirstMasterView() //(navController: $navController)
                .font(.title)
                .tabItem {
                    VStack {
                      Image(systemName: "waveform.path.ecg.rectangle")
                        Text("Home")
                    }
                }
                .tag(0)
            
            MathGameView() //(navController: $navController)
                .font(.title)
                .tabItem {
                    VStack {
                      Image(systemName: "gamecontroller")
                        Text("Games")
                    }
                }
                .tag(1)
            
            ThirdMasterView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                         Text("Shop")
                    }
                }
                .tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NavigationController())
    }
}
#endif
