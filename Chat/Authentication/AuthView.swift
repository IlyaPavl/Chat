//
//  AuthView.swift
//  Chat
//
//  Created by Илья Павлов on 26.05.2026.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        AuthScreenLayout {
            VStack(alignment: .leading, spacing: Layout.AuthFlow.sectionSpacing) {
                AuthTitleLabel(
                    title: .appName,
                    font: Typography.loginLogoFont
                )
                .padding(.bottom, Layout.AuthFlow.headerToContent - Layout.AuthFlow.sectionSpacing)

                ButtonFormRow(title: .authGoogleLabel) {
                    AuthGlassButton.google
                }

                ButtonFormRow(title: .authOrEmailLabel) {
                    AuthGlassButton.email
                }
            }
        } footer: {
            AuthFooter(title: .authAlreadyHaveAccountLabel) {
                AuthPlainButton(title: .authLoginButtonTitle)
            }
        }
    }
}

#Preview {
    AuthView()
}
