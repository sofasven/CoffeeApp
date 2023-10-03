//
//  CoffeeData.swift
//  CoffeeApp
//
//  Created by Sofa on 21.09.23.
//

import Foundation

class CoffeeData {
    
    static let shared = CoffeeData()
    
    var coffees: [Coffee]
    
    private init() {
        
        coffees = [Coffee(name: "Эспрессо", price: 2.80, image: #imageLiteral(resourceName: "Эспрессо.jpg")),
                   Coffee(name: "Американо", price: 2.80, image: #imageLiteral(resourceName: "Американо.jpg")),
                   Coffee(name: "Капучино", price: 3.80, image: #imageLiteral(resourceName: "Капучино.jpg")),
                   Coffee(name: "Раф" , price: 3.80, image: #imageLiteral(resourceName: "Раф.jpg")),
                   Coffee(name: "Флэт Уайт", price: 2.80, image: #imageLiteral(resourceName: "Флет Уайт.jpg"))]
    }
}
