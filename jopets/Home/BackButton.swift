//
//  BackButton.swift
//  jopets
//
//  Created by Alvin Tu on 4/22/21.
//  Copyright © 2021 kar.par. All rights reserved.
//

import SwiftUI

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
struct MyBackButton_Previews: PreviewProvider {
    static var previews: some View {
      MyBackButton(label: "hello", closure: {})
    }
}
