//
//  FormField.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import SwiftUI

struct FormField: View {
    let title: LocalizedStringResource
    @Binding var text: String
    var isSecure = false
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType?
    var autocapitalization: TextInputAutocapitalization = .sentences

    var body: some View {
        VStack(alignment: .leading, spacing: Layout.AuthFlow.labelToControl) {
            Text(title)
                .font(Typography.commonLabelFont)
                .foregroundStyle(.primary)

            Group {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .font(Typography.commonLabelFont)
            .textInputAutocapitalization(autocapitalization)
            .keyboardType(keyboardType)
            .textContentType(textContentType)
            .formFieldBorder()
        }
    }
}

extension View {
    func formFieldBorder(
        minHeight: CGFloat = Layout.TextField.height,
        alignment: Alignment = .leading
    ) -> some View {
        padding(.horizontal, Layout.Spacing.s)
            .frame(maxWidth: .infinity, minHeight: minHeight, alignment: alignment)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: Layout.CornerRadius.button))
            .overlay {
                RoundedRectangle(cornerRadius: Layout.CornerRadius.button)
                    .strokeBorder(Color(.systemGray4), lineWidth: Layout.TextView.borderWidth)
            }
    }
}
