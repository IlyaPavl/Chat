//
//  ActiveChatsSection.swift
//  Chat
//
//  Created by Илья Павлов on 08.07.2026.
//

import SwiftUI

struct ActiveChatsSection: View {
    let chats: [ChatListModel]

    var body: some View {
        Section {
            LazyVStack(spacing: Layout.Spacing.s) {
                ForEach(chats) { chat in
                    ActiveChatRow(username: chat.username, lastMessage: chat.lastMessage)
                }
            }
        } header: {
            ChatSectionHeader(title: .chatListActiveHeader)
        }
    }
}
