//
//  WaitingChatsSection.swift
//  Chat
//
//  Created by Илья Павлов on 08.07.2026.
//

import SwiftUI

struct WaitingChatsSection: View {
    let chats: [ChatListModel]

    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack(spacing: Layout.Spacing.m) {
                    ForEach(chats) { chat in
                        WaitingChatRow(name: chat.username.firstWord)
                    }
                }
            }
            .scrollIndicators(.hidden)
        } header: {
            ChatSectionHeader(title: .chatListWaitingHeader)
        }
    }
}
