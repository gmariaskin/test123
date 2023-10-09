//
//  CollectionViewModel.swift
//  Test1
//
//  Created by Gleb on 10.09.2023.
//
//    FIXME: убрать UIKit, вернуть Foundation
import UIKit

struct CollectionModel {
//    FIXME: убрать опционалы
    let name: String?
    let image: UIImage?
    var description: String?
    var premium: Bool
}

// TODO: Сейчас массив в общем доступе для всего проекта, не гуд, когда любой файл имеет доступ к data, найти лучшее решение
let collectionModelArray: [CollectionModel]? = [
    CollectionModel(name: "Clean Photos", image: UIImage(named: "cleanPhotos"), description: "Total items: 6629", premium: true),
    CollectionModel(name: "Clean Contacts", image: UIImage(named: "cleanContacts"),  description: "Total items: 120", premium: true),
    CollectionModel(name: "Clean Calendar", image: UIImage(named: "cleanCalendar"),  description: "Total items: 19", premium: true),
    CollectionModel(name: "Clinder", image: UIImage(named: "clinder"),  description: "Clean photos in game", premium: false),
    CollectionModel(name: "Widgets", image: UIImage(named: "widgets"), description: "Clean on main screen", premium:  false),
    CollectionModel(name: "Speed test", image: UIImage(named: "speedTest"), description: "Check your internet", premium: false)
]


