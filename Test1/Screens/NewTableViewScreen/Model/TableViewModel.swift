//
//  NewTableViewModel.swift
//  Test1
//
//  Created by Gleb on 11.09.2023.
//

import UIKit

enum Premium {
    case premium
    case notPremium
}

enum CheckButtonState {
    case checked
    case unchecked
    case locked
}

struct Country {
    var premium: Bool?
    let emoji: UIImage?
    let countryName: String?
    let signal: Signal
    let delay: Int?
}

enum Signal {
    case weak
    case medium
    case strong
    case noSignal
}
//TODO: Массивы общедоступные во всем проекте, найти лучшее решение
let countries: [Country] = [
    
    Country(premium: false, emoji: UIImage(named: "france"), countryName: "France", signal: .strong, delay: 28),
    Country(premium: false, emoji: UIImage(named: "kazakhstan"), countryName: "Kazakhstan", signal: .strong, delay: 23),
    Country(premium: false, emoji: UIImage(named: "poland"), countryName: "Poland", signal: .weak, delay: 124),
    Country(premium: false, emoji: UIImage(named: "ukraine"), countryName: "Ukraine", signal: .medium, delay: 58),
    Country(premium: true, emoji: UIImage(named: "germany"), countryName: "Germany", signal: .strong, delay: 21),
    Country(premium: true, emoji: UIImage(named: "italy"), countryName: "Italy", signal: .medium, delay: 47),
    Country(premium: true, emoji: UIImage(named: "netherlands"), countryName: "Netherlands", signal: .strong, delay: 33),
    Country(premium: true, emoji: UIImage(named: "unitedKingdom"), countryName: "United Kingdom", signal: .strong, delay: 31),
    Country(premium: true, emoji: UIImage(named: "spain"), countryName: "Spain", signal: .strong, delay: 27),
    Country(premium: true, emoji: UIImage(named: "thailand"), countryName: "Thailand", signal: .medium, delay: 77),
    Country(premium: true, emoji: UIImage(named: "scotland"), countryName: "Scotland", signal: .strong, delay: 39),
    Country(premium: true, emoji: UIImage(named: "colombia"), countryName: "Colombia", signal: .weak, delay: 189),
    Country(premium: true, emoji: UIImage(named: "indonesia"), countryName: "Indonesia", signal: .noSignal, delay: 0)
]
