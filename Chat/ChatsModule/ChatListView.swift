//
//  ChatListView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import SwiftUI

struct ChatListView: View {
    @State private var store = ChatListStore()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: Layout.Spacing.m, pinnedViews: [.sectionHeaders]) {
                if !store.waitingChats.isEmpty {
                    WaitingChatsSection(chats: store.waitingChats)
                }

                if !store.activeChats.isEmpty {
                    ActiveChatsSection(chats: store.activeChats)
                }
            }
            .padding(Layout.Spacing.m)
        }
        .background(Color(.systemBackground))
        .navigationTitle(Text(.chatListTitle))
        .searchable(text: $store.searchText)
    }
}

#Preview {
    NavigationStack {
        ChatListView()
    }
}
