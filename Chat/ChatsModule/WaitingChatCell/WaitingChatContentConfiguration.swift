//
//  WaitingChatContentConfiguration.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//

import UIKit

struct WaitingChatContentConfiguration: UIContentConfiguration, Hashable {
    var name: String
    var avatarImage: UIImage?
    
    func makeContentView() -> UIView & UIContentView {
        WaitingChatContentView(configuration: self)
    }

    func updated(for state: UIConfigurationState) -> WaitingChatContentConfiguration {
        self
    }
}

enum WaitingChatCell {
    static func contentConfiguration(for item: ChatListModel) -> WaitingChatContentConfiguration {
        WaitingChatContentConfiguration(
            name: item.username.firstWord,
            avatarImage: UIImage(systemName: "person.crop.circle.dashed")
        )
    }
}
