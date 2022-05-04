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
		@Published var entry = ""
		
//		@Published var firstValue = 0
//		@Published var secondValue = 0
		@Published var answer = ""
		@Published var equation = ""
		
	
		
		private var firstValue: Int {
			return randomInt()
		}
		
		private var secondValue: Int {
			return randomInt()
		}
		
		
		
			func setUpEquation()  {
				equation = equation(int1: firstValue, int2: secondValue)
				answer = answer(int1:firstValue, int2: secondValue)
		
//				return equation == answer
		
			}
		
		func equation(int1: Int, int2: Int) -> String{
			return "\(int1) + \(int2)"
		}
		
		func answer(int1: Int, int2: Int) -> String{
			return String(int1 + int2)
		}
		
		func randomInt() -> Int{
			return Int.random(in: 100 ... 400)
			
		}
		 init() {
		}
	}
}
