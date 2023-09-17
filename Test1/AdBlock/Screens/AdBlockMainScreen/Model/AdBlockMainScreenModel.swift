//
//  MainScreenModel.swift
//  Test1
//
//  Created by Gleb on 17.09.2023.
//

import Foundation

struct MainTableViewCell {
    let header: String
    let counter: String
    let description: String
    let image: String
}

let mainViewCells: [MainTableViewCell] = [
MainTableViewCell(header: "Block rules", counter: "0 rules", description: "Pesonalize the blocklist for a more comfortable experience", image: "block"),
MainTableViewCell(header: "Block list", counter: "0 websites", description: "Manually enter a list of websites you wish to block", image: "list")
]
