//
//  Item.swift
//  Foody
//
//  Created by Aslan Murat on 29.01.2022.
//

import Foundation

class Item: Codable {
    var name: String
    var price: Int
    var preparationTime: Int
    var rating: Double?
    
    init(name: String, price: Int, preparationTime:Int, rating: Double?) {
        self.name = name
        self.price = price
        self.preparationTime = preparationTime
        self.rating = rating
    }
}
