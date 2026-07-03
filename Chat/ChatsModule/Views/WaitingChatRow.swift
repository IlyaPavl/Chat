//
//  WaitingChatRow.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//

import SwiftUI

struct WaitingChatRow: View {
    let name: String

    var body: some View {
        VStack(spacing: Layout.Spacing.xs) {
            Image(systemName: "person.crop.circle.dashed")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.secondary)
                .frame(width: Layout.Chats.avatarSize, height: Layout.Chats.avatarSize)
                .clipShape(Circle())

            Text(name)
                .font(Typography.commonTextFont)
                .foregroundStyle(.primary)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .frame(
            width: Layout.Chats.waitingChats.groupSize,
            height: Layout.Chats.waitingChats.groupSize
        )
        .chatCellBackground()
    }
}

private extension View {
    func chatCellBackground() -> some View {
        background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: Layout.CornerRadius.cell))
    }
}
