//
//  MainTabBarFactory.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

@MainActor
enum MainTabBarFactory {
    static func makeController() -> MainTabBarController {
        let tabBarController = MainTabBarController()
        tabBarController.tabs = MainTab.allCases.map(makeTab)
        return tabBarController
    }
}

private extension MainTabBarFactory {
    static func makeTab(for tab: MainTab) -> UITab {
        UITab(
            title: tab.title,
            image: tab.icon,
            identifier: tab.identifier
        ) { _ in
            makeNavigationController(for: tab)
        }
    }

    static func makeNavigationController(for tab: MainTab) -> UINavigationController {
        UINavigationController(rootViewController: makeRootViewController(for: tab))
    }

    static func makeRootViewController(for tab: MainTab) -> UIViewController {
        switch tab {
        case .chats: ChatListViewController()
        case .contacts: ContactListViewController()
        }
    }
}
