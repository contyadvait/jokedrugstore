//
//  DrugItem.swift
//  Drug Store (JOKE)
//
//  Created by Milind Contractor on 3/7/24.
//

import Foundation

struct Drug: Identifiable, Codable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var amount: Float = 100.0
    var price: Float = 100.0
    var priceLabel: String {
        return "$\(String(format: "%.2f", price))"
    }
    var amountLabel: String {
        return "\(String(format: "%.2f", amount)) kg"
    }
}
