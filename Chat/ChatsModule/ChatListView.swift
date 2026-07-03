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
                    Section {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: Layout.Spacing.m) {
                                ForEach(store.waitingChats) { chat in
                                    WaitingChatRow(name: chat.username.firstWord)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    } header: {
                        ChatSectionHeader(title: .chatListWaitingHeader)
                    }
                }

                if !store.activeChats.isEmpty {
                    Section {
                        LazyVStack(spacing: Layout.Spacing.s) {
                            ForEach(store.activeChats) { chat in
                                ActiveChatRow(username: chat.username, lastMessage: chat.lastMessage)
                            }
                        }
                    } header: {
                        ChatSectionHeader(title: .chatListActiveHeader)
                    }
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
