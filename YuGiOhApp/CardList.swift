//
//  CardList.swift
//  YuGiOhApp
//
//  Created by User on 06/10/23.
//

import SwiftUI

struct CardList: View {
    @ObservedObject var remoteCardLoader = RemoteCardLoader()

    var body: some View {
        NavigationStack {
            List(remoteCardLoader.cards, id: \.self) { card in
                NavigationLink(destination: CardDetails(card: card)) {
                    CardRow(card: card)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            await remoteCardLoader.fetchRemoteCards()
        }
    }
    
}
