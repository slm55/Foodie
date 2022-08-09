//
//  CartItem.swift
//  Foody
//
//  Created by Aslan Murat on 19.02.2022.
//

import Foundation

class CartItem {
    var item: Item
    var number: Int
    
    init(item: Item, number: Int) {
        self.item = item
        self.number = number
    }
}
