//
//  AuthFooter.swift
//  Chat
//
//  Created by Илья Павлов on 02.06.2026.
//

import SwiftUI

/// Footer: текст слева, кнопка справа.
struct AuthFooter<ButtonLabel: View>: View {
    let title: LocalizedStringResource
    @ViewBuilder let button: ButtonLabel

    var body: some View {
        HStack(alignment: .center, spacing: Layout.AuthFlow.footerItemSpacing) {
            Text(title)
                .font(Typography.commonLabelFont)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

            button
                .frame(height: Layout.Button.height)
        }
    }
}
