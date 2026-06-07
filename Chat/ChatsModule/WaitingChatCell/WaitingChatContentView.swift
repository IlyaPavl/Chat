//
//  WaitingChatContentView.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//

import UIKit

final class WaitingChatContentView: UIView, UIContentView {

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = .secondaryLabel
        return imageView
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.commonTextFont
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = .one
        return label
    }()

    private var appliedConfiguration: WaitingChatContentConfiguration

    var configuration: UIContentConfiguration {
        get { appliedConfiguration }
        set {
            guard let configuration = newValue as? WaitingChatContentConfiguration else { return }
            apply(configuration)
        }
    }

    init(configuration: WaitingChatContentConfiguration) {
        appliedConfiguration = configuration
        super.init(frame: .zero)
        setupUI()
        apply(configuration)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = Layout.Chats.avatarSize / 2
    }
}

private extension WaitingChatContentView {
    func setupUI() {
        let stack = UIStackView(arrangedSubviews: [avatarImageView, usernameLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = Layout.Spacing.xs
        stack.distribution = .fill

        addSubview(stack)

        let avatarSize = Layout.Chats.avatarSize

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),

            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),
            usernameLabel.widthAnchor.constraint(equalTo: stack.widthAnchor),
        ])
    }

    func apply(_ configuration: WaitingChatContentConfiguration) {
        appliedConfiguration = configuration
        usernameLabel.text = configuration.name
        avatarImageView.image = configuration.avatarImage
    }
}
