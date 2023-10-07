//
//  RemoteCard.swift
//  YuGiOhApp
//
//  Created by User on 06/10/23.
//

import Foundation

struct RemoteCards: Decodable {
    let data: [Card]
}

struct Card: Decodable, Hashable {
    let name: String
    let cardImages: [CardImages]?
    let atk: Int?
    let def: Int?
}

struct CardImages: Decodable, Hashable{
    let imageUrl: String
}
