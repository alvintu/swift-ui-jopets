//
//  SecondDetailView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI

struct SecondDetailView: View {
       
    @EnvironmentObject var nav: NavigationController
    
    var body: some View {
        VStack(spacing: 20) {
          Text("jocoins: \(self.nav.jocoins)")
            Text("second detail View").font(.title)
          
          Button(action: {
            self.nav.jocoins += 1
          }) { Text("Earn 1 jocoin")
          }
          Button(action: {
            self.nav.jocoins += 5
          }) { Text("Earn 5 jocoins")
          }
          
            
            Button(action: {
                self.nav.tab1Detail1IsShown = true
                self.nav.tab2Detail1IsShown = false
                self.nav.selection = 0
            }) { Text("Go to first tab detail")
            }
            
            Button(action: {
                self.nav.tab1Detail1IsShown = false
                self.nav.tab2Detail1IsShown = false
                self.nav.selection = 0
            }) { Text("Go to first tab master")
            }
            
            TextField("enter data to send around", text: self.$nav.data)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            
        }
            
            
            //   workaround problem with back button
            .navigationBarBackButtonHidden(true) // not needed, but just in case
            .navigationBarItems(leading: MyBackButton(label: "Back") {
                self.nav.tab2Detail1IsShown = false
            })
    }
}
