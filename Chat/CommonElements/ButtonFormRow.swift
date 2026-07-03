//
//  ButtonFormRow.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import SwiftUI

struct ButtonFormRow<ButtonLabel: View>: View {
    let title: LocalizedStringResource
    @ViewBuilder let button: ButtonLabel

    var body: some View {
        VStack(alignment: .leading, spacing: Layout.AuthFlow.labelToControl) {
            Text(title)
                .font(Typography.commonLabelFont)
                .foregroundStyle(.primary)

            button
                .frame(maxWidth: .infinity)
        }
    }
}
