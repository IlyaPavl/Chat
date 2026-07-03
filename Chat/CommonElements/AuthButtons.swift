//
//  AuthButtons.swift
//  Chat
//
//  Created by Илья Павлов on 26.05.2026.
//

import SwiftUI
import Resources

/// Кнопка в стиле glass с опциональной иконкой слева.
struct AuthGlassButton: View {
    let title: LocalizedStringResource
    var systemImage: String?
    var assetImage: Image?
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            HStack(spacing: Layout.Spacing.s) {
                if let assetImage {
                    assetImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: Layout.Button.iconSize, height: Layout.Button.iconSize)
                } else if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: Layout.Button.iconSize))
                }
                Text(title)
                    .font(Typography.buttonFont)
            }
            .frame(maxWidth: .infinity, minHeight: Layout.Button.height)
        }
        .buttonStyle(.glass)
        .foregroundStyle(.primary)
    }
}

extension AuthGlassButton {
    static var google: Self {
        Self(
            title: .authGoogleButtonTitle,
            assetImage: Image(uiImage: Asset.Icons.google.image)
        )
    }

    static var email: Self {
        Self(title: .authEmailButtonTitle, systemImage: "envelope")
    }
}

/// Текстовая кнопка коричневого цвета.
struct AuthPlainButton: View {
    let title: LocalizedStringResource
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Typography.buttonFont)
        }
        .buttonStyle(.plain)
        .foregroundStyle(.brown)
    }
}

/// Акцентная зелёная кнопка основного действия.
struct AuthProminentButton: View {
    let title: LocalizedStringResource
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Typography.buttonFont)
                .frame(maxWidth: .infinity, minHeight: Layout.Button.height)
        }
        .buttonStyle(.glassProminent)
        .tint(.green)
        .foregroundStyle(.primary)
    }
}
