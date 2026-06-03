//
//  LoginViewController.swift
//  Chat
//
//  Created by Илья Павлов on 02.06.2026.
//

import UIKit
import Resources

final class LoginViewController: UIViewController {

    private let headerView = AuthTitleView(
        title: String(localized: .authSignupWelcomeLabel),
        font: Typography.welcomeLogoFont,
        numberOfLines: 0
    )

    private let googleButton = UIButton(
        configurationStyle: .glass(),
        image: Asset.Icons.google.image,
        imageSize: CGSize(width: Layout.Button.iconSize, height: Layout.Button.iconSize),
        title: String(localized: .authGoogleButtonTitle),
        foregroundColor: .label
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
        textField.textContentType = .password
        return textField
    }()

    private let signUpButton = UIButton(
        configurationStyle: .plain(),
        title: String(localized: .authSignupButtonTitle),
        foregroundColor: .systemBrown
    )

    private let loginButton = UIButton(
        configurationStyle: .prominentGlass(),
        backgroundColor: .systemGreen,
        title: String(localized: .authLoginButtonTitle),
        foregroundColor: .label
    )

    private lazy var signupFooter = AuthFooterView(
        title: String(localized: .authNeedAccountLabel),
        button: signUpButton
    )

    private lazy var contentStackView: UIStackView = {
        let googleRow = ButtonFormView(
            title: String(localized: .authGoogleLabel),
            button: googleButton
        )

        let orLabel = UILabel()
        orLabel.text = String(localized: .authOrLabel)
        orLabel.font = Typography.commonLabelFont
        orLabel.textColor = .label

        let emailField = FormFieldView(title: String(localized: .authEmailLabel), textField: emailTextField)
        let passwordField = FormFieldView(
            title: String(localized: .authSignupPasswordLabel),
            textField: passwordTextField
        )
        let stackView = UIStackView(arrangedSubviews: [
            headerView,
            googleRow,
            orLabel,
            emailField,
            passwordField,
            loginButton,
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

private extension LoginViewController {
    func setupUI() {
        [contentStackView, signupFooter].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        loginButton.heightAnchor.constraint(equalToConstant: Layout.Button.height).isActive = true

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
                
                signupFooter.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -Layout.AuthFlow.footerBottomInset
                ),
                signupFooter.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: Layout.AuthFlow.horizontalInset
                ),
                signupFooter.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -Layout.AuthFlow.horizontalInset
                ),
            ]
        )
    }
}

#Preview {
    LoginViewController()
}
