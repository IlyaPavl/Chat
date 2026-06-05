//
//  ChatListModel.swift
//  Chat
//
//  Created by Илья Павлов on 04.06.2026.
//

import Foundation

nonisolated struct ChatListModel: Hashable, Sendable {
    let id: UUID
    let username: String
    let avatarURL: URL?
    let lastMessage: String
    let state: ChatListState

    init(id: UUID = UUID(), username: String, avatarURL: URL? = nil, lastMessage: String, state: ChatListState) {
        self.id = id
        self.username = username
        self.avatarURL = avatarURL
        self.lastMessage = lastMessage
        self.state = state
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension ChatListModel {
    static var mock: [Self] {
        mockData.enumerated().map { index, listItem in
            ChatListModel(
                username: listItem.username,
                lastMessage: listItem.lastMessage,
                state: index < 10 ? .waiting : .active
            )
        }
    }

    private static let mockData: [(username: String, lastMessage: String)] = [
        ("Ivan Ivanov", "Hey, how are you?"),
        ("Ivan Petrov", "Okay, got it"),
        ("Peter Ivanov", "Sounds good"),
        ("Alex Smith", "What's new?"),
        ("Dmitry Kozlov", "I'll be there soon"),
        ("Sergey Volkov", "Sure, no problem"),
        ("Andrey Morozov", "I got you"),
        ("Max Petrov", "I'm online"),
        ("Nikita Fedorov", "Good morning"),
        ("Egor Sokolov", "Bye"),
        ("Artem Lebedev", "Alright, waiting"),
        ("Roman Novikov", "Great"),
        ("Ilya Morozov", "Send it later"),
        ("Konstantin Orlov", "Thanks!"),
        ("Vladislav Kuznetsov", "Yep"),
        ("Pavel Zaitsev", "Awesome"),
        ("Mikhail Popov", "How about you?"),
        ("Timofey Sidorov", "I'll be there in 10 minutes"),
        ("Victor Egorov", "Yes, of course"),
        ("Yuri Pavlov", "Okay, thanks"),
        ("Oleg Nikolaev", "Text me if anything"),
        ("Ruslan Zakharov", "Alright, deal"),
        ("Arseny Vinogradov", "Let me check"),
        ("Georgy Belov", "No problem"),
        ("Daniil Frolov", "I'm already on my way"),
        ("Valery Melnikov", "I'll call you later"),
        ("Igor Andreev", "Okay"),
        ("Kirill Stepanov", "I'll check now"),
        ("Anton Kiselev", "Doesn't matter"),
        ("Vyacheslav Gromov", "I'm good"),
        ("Stepan Danilov", "Sent the file"),
        ("Nikolay Belyaev", "Please take a look"),
        ("Fyodor Tikhonov", "Let's do tomorrow"),
        ("Peter Alekseev", "I'm busy right now"),
        ("Alexander Zhukov", "Agreed"),
        ("Vasily Fomin", "Cool"),
        ("Vitali Makаров", "What time is the meeting?"),
        ("Gleb Nikitin", "Waiting for your reply"),
        ("Denis Baranov", "Okay, we'll call later"),
        ("Evgeny Tarasov", "Thanks a lot"),
        ("Boris Komarov", "Noted"),
        ("Ruslan Kovalev", "Yeah, yeah"),
        ("Anatoly Panin", "I'll write now"),
        ("Mark Sorokin", "Got it, thanks"),
        ("Lev Ershov", "All good"),
        ("Ilyas Romanov", "When is good for you?"),
        ("Saveliy Gavrilov", "Already on the way"),
        ("Matvey Bychkov", "We'll discuss it later"),
        ("Adam Korolev", "Have a nice day"),
        ("Elisei Titov", "Sent it"),
        ("Miron Chernov", "I'm waiting"),
        ("Rostislav Krylov", "Let's have a call"),
    ]
}
