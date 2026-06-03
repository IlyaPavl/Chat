//
//  AuthViewController.swift
//  Chat
//
//  Created by Илья Павлов on 26.05.2026.
//

import UIKit
import Resources
import SwiftUI

final class AuthViewController: UIViewController {

    private let headerView = AuthTitleView(
        title: String(localized: .appName),
        font: Typography.loginLogoFont
    )

    private let googleButton = UIButton(
        configurationStyle: .glass(),
        image: Asset.Icons.google.image,
        imageSize: CGSize(width: Layout.Button.iconSize, height: Layout.Button.iconSize),
        title: String(localized: .authGoogleButtonTitle),
        foregroundColor: .label
    )

    private let emailButton = UIButton(
        configurationStyle: .glass(),
        image: UIImage(systemName: "envelope"),
        title: String(localized: .authEmailButtonTitle),
        foregroundColor: .label,
        symbolPointSize: Layout.Button.iconSize
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
        let googleRow = ButtonFormView(title: String(localized: .authGoogleLabel), button: googleButton)
        let emailRow = ButtonFormView(title: String(localized: .authOrEmailLabel), button: emailButton)
        let stackView = UIStackView(arrangedSubviews: [googleRow, emailRow])
        stackView.axis = .vertical
        stackView.spacing = Layout.AuthFlow.sectionSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
}

private extension AuthViewController {
    func setupUI() {
        [contentStackView, loginFooter].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

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
                )
            ]
        )

        contentStackView.insertArrangedSubview(headerView, at: 0)
        contentStackView.setCustomSpacing(Layout.AuthFlow.headerToContent, after: headerView)
    }
}

#Preview {
    AuthViewController()
}
