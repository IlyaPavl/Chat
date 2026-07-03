//
//  SignUpView.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        AuthScreenLayout {
            VStack(alignment: .leading, spacing: Layout.AuthFlow.sectionSpacing) {
                AuthTitleLabel(
                    title: .authSignupWelcomeLabel,
                    font: Typography.welcomeLogoFont,
                    lineLimit: nil
                )
                .padding(.bottom, Layout.AuthFlow.headerToContent - Layout.AuthFlow.sectionSpacing)

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
                    textContentType: .newPassword
                )

                FormField(
                    title: .authSignupConfirmPasswordLabel,
                    text: $confirmPassword,
                    isSecure: true,
                    textContentType: .newPassword
                )

                AuthProminentButton(title: .authSignupButtonTitle)
                    .frame(height: Layout.Button.height)
            }
        } footer: {
            AuthFooter(title: .authAlreadyHaveAccountLabel) {
                AuthPlainButton(title: .authLoginButtonTitle)
            }
        }
    }
}

#Preview {
    SignUpView()
}
