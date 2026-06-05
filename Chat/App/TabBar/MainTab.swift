//
//  MainTab.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

enum MainTab: CaseIterable {
    case chats
    case contacts
    
    var title: String {
        switch self {
        case .chats: String(localized: .tabChatTitle)
        case .contacts: String(localized: .tabContactTitle)
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .chats:
            UIImage(systemName: "message")
        case .contacts:
            UIImage(systemName: "person.2")
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .chats: UIImage(systemName: "message.fill")
        case .contacts: UIImage(systemName: "person.2.fill")
        }
    }

    var identifier: String {
        switch self {
        case .chats: "chats"
        case .contacts: "contacts"
        }
    }
}

