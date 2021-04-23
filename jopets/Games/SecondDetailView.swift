//
//  SecondDetailView.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct SecondDetailView: View {
  @State var interstitial: GADRewardedInterstitialAd!
  @State var rewardedAd: GADRewardedAd!

    @EnvironmentObject var nav: NavigationController
    
    var body: some View {
        VStack(spacing: 20) {
          Text("jocoins: \(self.nav.jocoins)")
            Text("second detail View").font(.title)
          
          Button(action: {
            if interstitial != nil {
              let root = UIApplication.shared.windows.first?.rootViewController
              interstitial.present(fromRootViewController: root!, userDidEarnRewardHandler: {
                self.nav.jocoins += 1

              })
            } else {
              print("Ad wasn't ready")
            }

//            self.nav.jocoins += 1
          }) { Text("Earn 1 jocoin")
          }
          Button(action: {
            
            if rewardedAd != nil {
              let root = UIApplication.shared.windows.first?.rootViewController
              rewardedAd.present(fromRootViewController: root!, userDidEarnRewardHandler: {
                self.nav.jocoins += 5

              })
            } else {
              print("Ad wasn't ready")
            }
            
//            self.nav.jocoins += 5
          }) { Text("Earn 5 jocoins")
          }
          
            
            Button(action: {
                self.nav.tab1Detail1IsShown = true
                self.nav.tab2Detail1IsShown = false
                self.nav.selection = 0
            }) {
              Text("Inventory")
              Image(systemName: "bag")
            }
            
            Button(action: {
                self.nav.tab1Detail1IsShown = false
                self.nav.tab2Detail1IsShown = false
                self.nav.selection = 0
            }) { Text("Shop")
            }
            
            TextField("shoppingList", text: self.$nav.data)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
          
          let rows = [
            GridItem(.adaptive(minimum: 100))
          ]
          
          let data = self.nav.foodDictionary
          
          ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 5) {
              ForEach(data.sorted(by: >), id: \.key) { key, value in
                Button(action:{
                  self.nav.data.append(key)
                })
                {
                  ShopItem(key: key, value: value)
                }
              }
            }
            .padding(.horizontal)
          }

            
        
     
        }
            
            //   workaround problem with back button
            .navigationBarBackButtonHidden(true) // not needed, but just in case
            .navigationBarItems(leading: MyBackButton(label: "Back") {
                self.nav.tab2Detail1IsShown = false
            
            })
      
        .onAppear(perform: {
          let request = GADRequest()
          GADRewardedInterstitialAd.load(withAdUnitID:"ca-app-pub-1973237642510038/9156852793",
                                      request: request,
                            completionHandler: { [self] ad, error in
                              if let error = error {
                                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                return
                              }
                              interstitial = ad
                            }
          )
        
          let rewardedRequest = GAMRequest()
          GADRewardedAd.load(withAdUnitID: "ca-app-pub-1973237642510038/7222962202", request: rewardedRequest) { (advertisement, error) in
            if let error = error {
              print("failed to load rewarded error with \(error.localizedDescription)")
              return
            }
            rewardedAd = advertisement
          }
        
        })
    }
}
