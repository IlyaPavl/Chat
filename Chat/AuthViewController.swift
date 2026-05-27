//
//  ViewController.swift
//  Chat
//
//  Created by Илья Павлов on 26.05.2026.
//

import UIKit
import Resources
import SwiftUI

final class AuthViewController: UIViewController {

    private let logoLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.loginLogoFont
        label.textColor = .label
        label.text = String(localized: .appName)
        return label
    }()

    private let googleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.commonLabelFont
        label.text = String(localized: .loginGoogleHeader)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.commonLabelFont
        label.text = String(localized: .loginEmailHeader)
        return label
    }()

    private let alreadyOnboardLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.commonLabelFont
        label.text = String(localized: .loginAlreadyHaveAccount)
        return label
    }()

    private let googleButton = UIButton(
        configurationStyle: .glass(),
        image: Asset.Icons.google.image,
        imageSize: CGSize(width: 20, height: 20),
        title: String(localized: .loginGoogleButtonTitle),
        foregroundColor: .label
    )

    private let emailButton = UIButton(
        configurationStyle: .glass(),
        image: UIImage(systemName: "envelope"),
        title: String(localized: .loginEmailButtonTitle),
        foregroundColor: .label,
        symbolPointSize: 14,
    )

    private let loginButton = UIButton(
        configurationStyle: .prominentGlass(),
        backgroundColor: .systemGreen,
        title: String(localized: .loginActionButtonTitle),
        foregroundColor: .label
    )

    private lazy var stackView: UIStackView = {
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardLabel, button: loginButton)

        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView])
        stackView.setCustomSpacing(Layout.Login.loginViewSpacing, after: emailView)
        stackView.axis = .vertical
        stackView.spacing = Layout.Login.stackViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension AuthViewController {
    func setupUI() {
        addSubviews()
        addConstraints()
    }

    func addSubviews() {
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoLabel)
        view.addSubview(stackView)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Layout.Login.logoHeight),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: Layout.Spacing.xxxxl),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Layout.Spacing.xl),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Layout.Spacing.xl),
        ])
    }
}

#Preview {
    AuthViewController()
}
