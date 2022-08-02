//
//  ContentView.swift
//  RestaurantMenuList
//
//  Created by Stefania Zinno for the Developer Academy on 15/10/21.
//
//


import SwiftUI
struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: String
}

let dishes: [Dish] = [
    Dish(name: "🍕 Pizza", description: "One of the beauty you have to try in Naples!", price: "10 euro"),
    Dish(name: "🍔 Hamburger", description: "I'm loving it! Since 1920, you will find the best hamburger ever here.", price: "12 euro"),
    Dish(name: "🍣 Sushi", description: "Coming from very very far away, as Shrek says, Sushi is one delicious meal", price: "17 euro")
]

struct RestaurantMenuRow: View {
    var dish: Dish
    var body: some View {
        Text("\(dish.name)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
        List(dishes) { dish in
           NavigationLink(
            destination: DetailView(dishDetail: dish)){
                RestaurantMenuRow(dish: dish)
            }.navigationTitle(Text("Menu Dishes"))
            }.navigationViewStyle(.stack)
        }
    }
    
    struct DetailView: View {
        let dishDetail: Dish
        var body: some View {
            VStack(alignment: .leading, content: {
                Text("\(dishDetail.description)")
                Text("\(dishDetail.price)").bold()
                Spacer()
            }).padding(.all).navigationBarTitle("\(dishDetail.name)", displayMode: .inline)
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
