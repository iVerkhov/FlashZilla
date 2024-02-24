//
//  Card.swift
//  FlashZilla
//
//  Created by Игорь Верхов on 23.02.2024.
//

import Foundation

struct Card: Codable, Equatable, Hashable, Identifiable {
    var id = UUID()
    var promt:String
    var answer: String
    
    static let example = Card(promt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
