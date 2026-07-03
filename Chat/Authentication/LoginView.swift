//
//  LoginView.swift
//  Chat
//
//  Created by Илья Павлов on 02.06.2026.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        AuthScreenLayout {
            VStack(alignment: .leading, spacing: Layout.AuthFlow.sectionSpacing) {
                AuthTitleLabel(
                    title: .authSignupWelcomeLabel,
                    font: Typography.welcomeLogoFont,
                    lineLimit: nil
                )
                .padding(.bottom, Layout.AuthFlow.headerToContent - Layout.AuthFlow.sectionSpacing)

                ButtonFormRow(title: .authGoogleLabel) {
                    AuthGlassButton.google
                }

                Divider()

                FormField(
                    title: .authEmailLabel,
                    text: $email,
                    keyboardType: .emailAddress,
                    textContentType: .emailAddress,
                    autocapitalization: .never
                )

                FormField(
                    title: .authSignupPasswordLabel,
                    text: $password,
                    isSecure: true,
                    textContentType: .password
                )

                AuthProminentButton(title: .authLoginButtonTitle)
                    .frame(height: Layout.Button.height)
            }
        } footer: {
            AuthFooter(title: .authNeedAccountLabel) {
                AuthPlainButton(title: .authSignupButtonTitle)
            }
        }
    }
}

#Preview {
    LoginView()
}
