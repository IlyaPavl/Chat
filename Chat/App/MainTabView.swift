//
//  MainTabView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab(MainTab.chats.title, systemImage: MainTab.chats.icon) {
                NavigationStack {
                    ChatListView()
                }
            }

            Tab(MainTab.contacts.title, systemImage: MainTab.contacts.icon) {
                NavigationStack {
                    ContactListView()
                }
            }
        }
        .tint(.brown)
    }
}

#Preview {
    MainTabView()
}
