//
//  NavigationController.swift
//  NavigationSwiftUI
//
//  Created by Karin Prater on 15.08.19.
//  Copyright © 2019 kar.par. All rights reserved.
//



import SwiftUI

struct Jopet{
  let name: String
  let hitPoints: Int
  let hunger: Float
  let level: Int
  let personality: String
}

struct InventoryItem: Identifiable{
  let id = UUID()
  
  let emoji: String
  let name: String
}


final class NavigationController: ObservableObject  {
   
  @Published var selection: Int = 0
  
  @Published var tab1Detail1IsShown = false
  @Published var tab1Detail2IsShown = false
  
  @Published var tab2Detail1IsShown = false
  @Published var tab2Detail2IsShown = false
  
  @Published var goToRootController = false
  
  @Published var data: String = "your shopping list" //data shared by multiple views, to hand around
  @Published var jocoins: Int = 0 //data shared by multiple views, to hand around
  
  @Published var doge: Jopet = Jopet(name: "Doge", hitPoints: 100 , hunger: 10.0, level: 1, personality: "mean")
  @Published var cate: Jopet = Jopet(name: "Cate", hitPoints: 100 , hunger: 10.0, level: 1, personality: "mean")
  @Published var birde: Jopet = Jopet(name: "Birde", hitPoints: 100 , hunger: 10.0, level: 1, personality: "mean")
  @Published var inventory: [InventoryItem] = []
  @Published var entry: String = ""
  @Published var answer = ""
  @Published var firstValue : Int = 0
  @Published var secondValue : Int = 0
  
  
  
  
  
  
  
  
  @Published var equation : String = ""
  @Published var foodDictionary: [String:String] = [
    "🍇" : "Grapes",
    "🍈" : "Melon",
    "🍉" :  "Watermelon",
    "🍊" : "Tangerine",
    "🍋" :  "Lemon",
    "🍌" :  "Banana",
    "🍍" :  "Pineapple",
    "🥭" : "Mango",
    "🍎" :"Red Apple",
    "🍏" : "Green Apple",
    "🍐" : "Pear",
    "🍑" : "Peach",
    "🍒" : "Cherries",
    "🍓" : "Strawberry",
    "🫐" : "Blueberries",
    "🥝" : "Kiwi",
    "🍅" :"Tomato",
    "🫒" :"Olive",
    "🥥" :"Coconut",
    "🥑" :"Avocado",
    "🍆" :"Eggplant",
    "🥔" :"Potato",
    "🥕" :"Carrot",
    "🌽" :"Ear of Corn",
    "🌶️" : "Hot Pepper",
    "🫑 ":"Bell Pepper",
    "🥒":"Cucumber",
    "🥬" :"Leafy Green",
    "🥦" :"Broccoli",
    "🧄" :"Garlic",
    "🧅" :"Onion",
    "🍄" :"Mushroom",
    "🥜" :"Peanuts",
    "🌰" :"Chestnut",
    "🍞" :"Bread",
    "🥐" :"Croissant",
    "🥖" :"Baguette Bread",
    "🫓" :"Flatbread",
    "🥨" :"Pretzel",
    "🥯": "Bagel",
    "🥞": "Pancakes",
    "🧇": "Waffle",
    "🧀" :"Cheese Wedge",
    "🍖" :"Meat on Bone",
    "🍗" :"Poultry Leg",
    "🥩" :"Cut of Meat",
    "🥓" :"Bacon",
    "🍔" :"Hamburger",
    "🍟" :"French Fries",
    "🍕" : "Pizza",
    "🌭" : "Hot Dog",
    "🥪 ": "Sandwich",
//    🌮 : Taco
//    🌯 : Burrito
//    🫔 : Tamale
//    🥙 : Stuffed Flatbread
//    🧆 : Falafel
//    🥚 : Egg
//    🥘 : Shallow Pan of Food
//    🍲 : Pot of Food
//    🫕 : Fondue
//    🥣 : Bowl with Spoon
//    🥗 : Green Salad
//    🍿 : Popcorn
//    🧈 : Butter
//    🧂 : Salt
//    🥫 : Canned Food
//    🍱 : Bento Box
//    🍘 : Rice Cracker
//    🍙 Rice Ball
//    🍚 Cooked Rice
//    🍛 Curry Rice
//    🍜 Steaming Bowl
//    🍝 Spaghetti
//    🍠 Roasted Sweet Potato
//    🍢 Oden
//    🍣 Sushi
//    🍤 Fried Shrimp
//    🍥 Fish Cake with Swirl
//    🥮 Moon Cake
//    🍡 Dango
//    🥟 Dumpling
//    🥠 Fortune Cookie
//    🥡 Takeout Box
//    🦪 Oyster
//    🍦 Soft Ice Cream
//    🍧 Shaved Ice
//    🍨 Ice Cream
//    🍩 Doughnut
//    🍪 Cookie
//    🎂 Birthday Cake
//    🍰 Shortcake
//    🧁 Cupcake
//    🥧 Pie
//    🍫 Chocolate Bar
//    🍬 Candy
//    🍭 Lollipop
//    🍮 Custard
//    🍯 Honey Pot
//    🍼 Baby Bottle
//    🥛 Glass of Milk
//    ☕ Hot Beverage
//    🫖 Teapot
//    🍵 Teacup Without Handle
//    🍶 Sake
//    🍾 Bottle with Popping Cork
//    🍷 Wine Glass
//    🍸 Cocktail Glass
//    🍹 Tropical Drink
//    🍺 Beer Mug
//    🍻 Clinking Beer Mugs
//    🥂 Clinking Glasses
//    🥃 Tumbler Glass
//    🥤 Cup with Straw
//    🧋 Bubble Tea
//    🧃 Beverage Box
//    🧉 Mate
//    🧊 Ice
  ]
  
  
  func setUpEquation() {
    self.firstValue = randomInt()
    self.secondValue = randomInt()
    self.equation = equation(int1: self.firstValue, int2: self.secondValue)
    self.answer = answer(int1:self.firstValue, int2: self.secondValue)

  }

  func equation(int1: Int, int2: Int) -> String{
    return "\(int1) + \(int2)"
  }
  
  func answer(int1: Int, int2: Int) -> String{
    return String(int1 + int2)
  }
  
  func randomInt() -> Int{
    return Int.random(in: 5 ... 10)
    
}
}




