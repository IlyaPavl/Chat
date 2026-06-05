//
//  MainTabBarController.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.tintColor = .systemBrown
    }
}

#Preview {
    MainTabBarFactory.makeController()
}
