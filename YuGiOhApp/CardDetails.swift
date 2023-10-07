//
//  CardDetails.swift
//  YuGiOhApp
//
//  Created by User on 06/10/23.
//

import SwiftUI

struct CardDetails: View {
    let card: Card
    @State var cardsImages = Image("defaultImage")

    var body: some View {
        VStack {
            cardsImages
            Text("name: \(card.name)")
            if let atk = card.atk{
                Text("atk: \(atk)")
            }
            if let def = card.def{
                Text("def: \(def)")
            }
        }
        .task {
            self.cardsImages = await UIImage.download(from: card.cardImages?.first?.imageUrl ?? "defaultImage")
        }
    }
}
