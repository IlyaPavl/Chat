//
//  AuthTitleLabel.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import SwiftUI

struct AuthTitleLabel: View {
    let title: LocalizedStringResource
    let font: Font
    var lineLimit: Int? = 1
    var multilineTextAlignment: TextAlignment = .center

    var body: some View {
        Text(title)
            .font(font)
            .foregroundStyle(.primary)
            .lineLimit(lineLimit)
            .multilineTextAlignment(multilineTextAlignment)
            .frame(maxWidth: .infinity)
    }
}
