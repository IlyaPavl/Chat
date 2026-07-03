//
//  ContactsListModel.swift
//  Chat
//
//  Created by Илья Павлов on 07.06.2026.
//

import Foundation

nonisolated struct ContactsListModel: Identifiable, Hashable, Sendable {
    let id: UUID
    let username: String
    let avatarURL: URL?

    init(id: UUID = UUID(), username: String, avatarURL: URL? = nil) {
        self.id = id
        self.username = username
        self.avatarURL = avatarURL
    }
}

extension ContactsListModel {
    static let mock: [Self] = [
        .init(
            username: "John Smith",
            avatarURL: URL(string: "https://picsum.photos/seed/johnsmith/200/200")
        ),
        .init(
            username: "Emily Johnson",
            avatarURL: URL(string: "https://picsum.photos/seed/emilyjohnson/200/200")
        ),
        .init(
            username: "Michael Brown",
            avatarURL: URL(string: "https://picsum.photos/seed/michaelbrown/200/200")
        ),
        .init(
            username: "Olivia Davis",
            avatarURL: URL(string: "https://picsum.photos/seed/oliviadavis/200/200")
        ),
        .init(
            username: "William Miller",
            avatarURL: URL(string: "https://picsum.photos/seed/williammiller/200/200")
        ),
        .init(
            username: "Sophia Wilson",
            avatarURL: URL(string: "https://picsum.photos/seed/sophiawilson/200/200")
        ),
        .init(
            username: "James Taylor",
            avatarURL: URL(string: "https://picsum.photos/seed/jamestaylor/200/200")
        ),
        .init(
            username: "Ava Anderson",
            avatarURL: URL(string: "https://picsum.photos/seed/avaanderson/200/200")
        ),
        .init(
            username: "Benjamin Thomas",
            avatarURL: URL(string: "https://picsum.photos/seed/benjaminthomas/200/200")
        ),
        .init(
            username: "Charlotte Jackson",
            avatarURL: URL(string: "https://picsum.photos/seed/charlottejackson/200/200")
        ),
        .init(
            username: "Henry White",
            avatarURL: URL(string: "https://picsum.photos/seed/henrywhite/200/200")
        ),
        .init(
            username: "Amelia Harris",
            avatarURL: URL(string: "https://picsum.photos/seed/ameliaharris/200/200")
        ),
        .init(
            username: "Alexander Martin",
            avatarURL: URL(string: "https://picsum.photos/seed/alexandermartin/200/200")
        ),
        .init(
            username: "Mia Thompson",
            avatarURL: URL(string: "https://picsum.photos/seed/miathompson/200/200")
        ),
        .init(
            username: "Daniel Garcia",
            avatarURL: URL(string: "https://picsum.photos/seed/dangelgarcia/200/200")
        ),
        .init(
            username: "Grace Martinez",
            avatarURL: URL(string: "https://picsum.photos/seed/gracemartinez/200/200")
        ),
        .init(
            username: "Matthew Robinson",
            avatarURL: URL(string: "https://picsum.photos/seed/matthewrobinson/200/200")
        ),
        .init(
            username: "Lily Clark",
            avatarURL: URL(string: "https://picsum.photos/seed/lilyclark/200/200")
        ),
        .init(
            username: "Ethan Rodriguez",
            avatarURL: URL(string: "https://picsum.photos/seed/ethanrodriguez/200/200")
        ),
        .init(
            username: "Ella Lewis",
            avatarURL: URL(string: "https://picsum.photos/seed/ellalewis/200/200")
        ),
    ]
}
