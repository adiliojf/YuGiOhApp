//
//  RemoteCardsLoader.swift
//  YuGiOhApp
//
//  Created by User on 06/10/23.
//

import Foundation

final class RemoteCardLoader: ObservableObject {
    @Published var cards: [Card] = []

    @MainActor
    func fetchRemoteCards() async {
        let session = URLSession.shared
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let (data, _) = try await session.data(
                for: URLRequest(
                    url: URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php")!
                )
            )

            let remoteCards = try decoder.decode(RemoteCards.self, from: data)

            self.cards = remoteCards.data
        } catch {
            print(error)
        }

    }
}
