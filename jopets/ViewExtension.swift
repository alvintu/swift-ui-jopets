//
//  ViewExtension.swift
//  jopets
//
//  Created by Alvin Tu on 5/4/22.
//  Copyright © 2022 kar.par. All rights reserved.
//

import SwiftUI

extension View {
	
	func dismissKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
	@ViewBuilder
	func isHidden(_ hidden: Bool) -> some View {
		if hidden {
			self.hidden()
		} else {
			self
		}
	}
	
	@ViewBuilder
	func isRemoved(_ remove: Bool) -> some View {
		if !remove {
			self
		}
	}
	
	@ViewBuilder
	func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
		self.frame(width: size, height: size, alignment: alignment)
	}
	
	@ViewBuilder
	func isBlurred(_ shouldBlur: Bool, radius: CGFloat = 10) -> some View {
		if shouldBlur {
			self.blur(radius: radius)
		} else {
			self
		}
	}
}
