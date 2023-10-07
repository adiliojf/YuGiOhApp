//
//  CardRow.swift
//  YuGiOhApp
//
//  Created by User on 06/10/23.
//

import SwiftUI

struct CardRow: View {
    let card: Card
    @State var cardsImage = Image("defaultImage")

    var body: some View {
        HStack {
            cardsImage
                .resizable()
                .frame(width: 120, height: 120)
            Text(card.name)
        }
        .task {
            self.cardsImage = await UIImage.download(from: card.cardImages?.first?.imageUrl ?? "defaultImage")
        }
    }
}

extension UIImage {
    static func download(from urlString: String) async -> Image {
        let url = URL(string: urlString)!
        let defaultImage = UIImage(named: "defaultImage")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let uiImage = UIImage(data: data) ?? defaultImage

            return .init(uiImage: uiImage)
        } catch {
            print(error)
        }

        return Image(uiImage: defaultImage)
    }
}
