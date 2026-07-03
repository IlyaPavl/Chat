//
//  ActiveChatRow.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//

import SwiftUI

struct ActiveChatRow: View {
    let username: String
    let lastMessage: String

    var body: some View {
        HStack(spacing: Layout.Spacing.s) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.secondary)
                .frame(width: Layout.Chats.avatarSize, height: Layout.Chats.avatarSize)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 0) {
                Text(username)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Text(lastMessage)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
            }
            .font(Typography.commonTextFont)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, Layout.Spacing.xs)
        .frame(minHeight: Layout.Chats.activeChats.groupHeight, alignment: .leading)
        .padding(.horizontal, Layout.Spacing.m)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: Layout.CornerRadius.cell))
    }
}
