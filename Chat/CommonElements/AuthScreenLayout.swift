//
//  AuthScreenLayout.swift
//  Chat
//
//  Created by Илья Павлов on 27.06.2026.
//

import SwiftUI

/// Общий каркас экранов Auth: контент сверху, footer снизу.
struct AuthScreenLayout<Content: View, Footer: View>: View {
    @ViewBuilder let content: Content
    @ViewBuilder let footer: Footer

    var body: some View {
        VStack(spacing: 0) {
            content
                .padding(.horizontal, Layout.AuthFlow.horizontalInset)
                .padding(.top, Layout.AuthFlow.topInset)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: Layout.AuthFlow.footerTopSpacing)

            footer
                .padding(.horizontal, Layout.AuthFlow.horizontalInset)
                .padding(.bottom, Layout.AuthFlow.footerBottomInset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
