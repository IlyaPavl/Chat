//
//  ActiveChatContentConfiguration.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//

import UIKit

struct ActiveChatContentConfiguration: UIContentConfiguration, Hashable {
    var username: String
    var lastMessage: String
    var avatarImage: UIImage?

    func makeContentView() -> UIView & UIContentView {
        ActiveChatContentView(configuration: self)
    }

    func updated(for state: UIConfigurationState) -> Self {
        self
    }
}

enum ActiveChatCell {
    static func contentConfiguration(for item: ChatListModel) -> ActiveChatContentConfiguration {
        ActiveChatContentConfiguration(
            username: item.username,
            lastMessage: item.lastMessage,
            avatarImage: UIImage(systemName: "person.circle.fill")
        )
    }
}






