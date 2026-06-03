//
//  SetupProfileViewController.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

final class SetupProfileViewController: UIViewController {
    
    private let headerView = AuthTitleView(
        title: String(localized: .authSetupProfileLabel),
        font: Typography.welcomeLogoFont,
        numberOfLines: 0
    )
    
    private let addProfilePhotoView = AddProfilePhotoView()
    
    private let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textContentType = .name
        return textField
    }()
    
    private let aboutMeTextView: UITextView = {
        let textView = UITextView()
        textView.autocapitalizationType = .sentences
        return textView
    }()
    
    private let readyButton = UIButton(
        configurationStyle: .prominentGlass(),
        backgroundColor: .systemGreen,
        title: String(localized: .authReadyButtonTitle),
        foregroundColor: .label
    )
    
    private lazy var contentStackView: UIStackView = {
        let fullNameField = FormFieldView(
            title: String(localized: .authFullNameLabel),
            textField: fullNameTextField
        )
        let aboutMeField = FormTextView(
            title: String(localized: .authAboutMeLabel),
            textView: aboutMeTextView
        )

        let stackView = UIStackView(arrangedSubviews: [
            headerView,
            addProfilePhotoView,
            fullNameField,
            aboutMeField,
            readyButton,
        ])
        stackView.axis = .vertical
        stackView.spacing = Layout.AuthFlow.sectionSpacing
        stackView.setCustomSpacing(Layout.AuthFlow.topInset, after: headerView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
}

private extension SetupProfileViewController {
    func setupUI() {
        view.addSubview(contentStackView)
        readyButton.heightAnchor.constraint(equalToConstant: Layout.Button.height).isActive = true
        setupConstraints()
    }
    
    func setupConstraints() {
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

            ]
        )
    }
}

#Preview {
    SetupProfileViewController()
}
