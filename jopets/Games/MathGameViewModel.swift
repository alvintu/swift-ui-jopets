//
//  MathGameViewModel.swift
//  jopets
//
//  Created by Alvin Tu on 5/4/22.
//  Copyright © 2022 kar.par. All rights reserved.
//
import SwiftUI

extension MathGameView {
	
	final class ViewModel: ObservableObject {
		@Published var answer = ""
		@Published var equation = ""
		@Published var firstValue = 0
		@Published var secondValue = 0
		var nav: NavigationController
		
		
		
		@Published var entry = "" {
			didSet {
				if entry == answer && entry != "" {
					entry = ""
					nav.jocoins += 10
					setUpEquation()
				}
				
				if entry.count > 3 {
					entry = ""
				}
			}
		}
		
		
		func setUpEquation()  {
			let firstValue = randomInt()
			let secondValue = randomInt()
			equation = equation(int1: firstValue, int2: secondValue)
			answer = answer(int1:firstValue, int2: secondValue)
			
		}
		
		func equation(int1: Int, int2: Int) -> String{
			return "\(int1) + \(int2)"
		}
		
		func answer(int1: Int, int2: Int) -> String{
			return String(int1 + int2)
		}
		
		private func randomInt() -> Int{
			return Int.random(in: 4 ... 7)
			
		}
		init(nav: NavigationController) {
			self.nav = nav
			setUpEquation()
		}
	}
}
