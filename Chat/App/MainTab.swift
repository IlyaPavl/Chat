//
//  MainTab.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import SwiftUI

enum MainTab: CaseIterable, Identifiable {
    case contacts
    case chats

    var id: Self { self }

    var title: LocalizedStringResource {
        switch self {
        case .chats: .tabChatTitle
        case .contacts: .tabContactTitle
        }
    }

    var icon: String {
        switch self {
        case .chats: "message"
        case .contacts: "person.2"
        }
    }
}
