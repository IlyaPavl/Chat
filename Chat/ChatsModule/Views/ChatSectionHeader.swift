//
//  ChatSectionHeader.swift
//  Chat
//
//  Created by Илья Павлов on 06.06.2026.
//

import SwiftUI

struct ChatSectionHeader: View {
    let title: LocalizedStringResource

    var body: some View {
        Text(title)
            .font(Typography.supHeaderFont)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
    }
}
