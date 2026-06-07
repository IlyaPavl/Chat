//
//  ActiveChatContentView.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//

import UIKit

final class ActiveChatContentView: UIView, UIContentView {

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = .secondaryLabel
        return imageView
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.commonTextFont
        label.textColor = .label
        label.numberOfLines = .one
//        label.backgroundColor = .green
        return label
    }()

    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.commonTextFont
        label.textColor = .secondaryLabel
        label.numberOfLines = .three
//        label.backgroundColor = .systemBlue
        return label
    }()

    private var appliedConfiguration: ActiveChatContentConfiguration

    var configuration: UIContentConfiguration {
        get { appliedConfiguration }
        set {
            guard let configuration = newValue as? ActiveChatContentConfiguration else { return }
            apply(configuration)
        }
    }

    init(configuration: ActiveChatContentConfiguration) {
        appliedConfiguration = configuration
        super.init(frame: .zero)
        setupUI()
        apply(configuration)
//        self.backgroundColor = .systemBrown
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

private extension ActiveChatContentView {
    func setupUI() {
        let textStack = UIStackView(arrangedSubviews: [usernameLabel, lastMessageLabel])
        textStack.axis = .vertical
        textStack.distribution = .fillEqually
        
        [textStack, avatarImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        let avatarSize = Layout.Chats.avatarSize
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),

            textStack.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Layout.Spacing.s),
            textStack.topAnchor.constraint(equalTo: topAnchor, constant: Layout.Spacing.xs),
            textStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.Spacing.xs),
        ])
    }

    func apply(_ configuration: ActiveChatContentConfiguration) {
        appliedConfiguration = configuration
        usernameLabel.text = configuration.username
        lastMessageLabel.text = configuration.lastMessage
        avatarImageView.image = configuration.avatarImage
    }
}
