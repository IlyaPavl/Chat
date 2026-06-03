//
//  SignUpViewController.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit
import SwiftUI

final class SignUpViewController: UIViewController {

    private let headerView = AuthTitleView(
        title: String(localized: .authSignupWelcomeLabel),
        font: Typography.welcomeLogoFont,
        numberOfLines: 0
    )

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textContentType = .newPassword
        return textField
    }()

    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textContentType = .newPassword
        return textField
    }()

    private let signUpButton = UIButton(
        configurationStyle: .glass(),
        title: String(localized: .authSignupButtonTitle),
        foregroundColor: .label
    )

    private let loginButton = UIButton(
        configurationStyle: .plain(),
        title: String(localized: .authLoginButtonTitle),
        foregroundColor: .systemBrown
    )

    private lazy var loginFooter = AuthFooterView(
        title: String(localized: .authAlreadyHaveAccountLabel),
        button: loginButton
    )

    private lazy var contentStackView: UIStackView = {
        let emailField = FormFieldView(title: String(localized: .authEmailLabel), textField: emailTextField)
        let passwordField = FormFieldView(
            title: String(localized: .authSignupPasswordLabel),
            textField: passwordTextField
        )
        let confirmPasswordField = FormFieldView(
            title: String(localized: .authSignupConfirmPasswordLabel),
            textField: confirmPasswordTextField
        )
        let stackView = UIStackView(arrangedSubviews: [
            headerView,
            emailField,
            passwordField,
            confirmPasswordField,
            signUpButton,
        ])
        stackView.axis = .vertical
        stackView.spacing = Layout.AuthFlow.sectionSpacing
        stackView.setCustomSpacing(Layout.AuthFlow.headerToContent, after: headerView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
}

private extension SignUpViewController {
    func setupUI() {
        [contentStackView, loginFooter].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        signUpButton.heightAnchor.constraint(equalToConstant: Layout.Button.height).isActive = true

        NSLayoutConstraint.activate(
            [
                contentStackView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: Layout.AuthFlow.topInset
                ),
                contentStackView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: Layout.AuthFlow.horizontalInset
                ),
                contentStackView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -Layout.AuthFlow.horizontalInset
                ),
                
                loginFooter.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -Layout.AuthFlow.footerBottomInset
                ),
                loginFooter.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: Layout.AuthFlow.horizontalInset
                ),
                loginFooter.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -Layout.AuthFlow.horizontalInset
                ),
            ]
        )
    }
}

#Preview {
    SignUpViewController()
}
