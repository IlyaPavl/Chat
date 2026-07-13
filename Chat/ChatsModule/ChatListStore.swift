//
//  ChatListStore.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import Foundation

@MainActor
@Observable
final class ChatListStore {
    private(set) var chats: [ChatListModel] {
        didSet { recomputeVisibleChats() }
    }

    var searchText = "" {
        didSet { recomputeVisibleChats() }
    }

    // Кэшированные производные коллекции: пересчитываются только при изменении
    // входных данных, а не при каждом вычислении body у наблюдающих вью.
    private(set) var waitingChats: [ChatListModel] = []
    private(set) var activeChats: [ChatListModel] = []

    init(chats: [ChatListModel] = ChatListModel.mock) {
        self.chats = chats
        recomputeVisibleChats()
    }

    private func recomputeVisibleChats() {
        let filtered: [ChatListModel]
        if searchText.isEmpty {
            filtered = chats
        } else {
            filtered = chats.filter {
                $0.username.localizedStandardContains(searchText)
                    || $0.lastMessage.localizedStandardContains(searchText)
            }
        }
        waitingChats = filtered.filter { $0.state == .waiting }
        activeChats = filtered.filter { $0.state == .active }
    }
}
