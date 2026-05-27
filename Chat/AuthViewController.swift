//
//  ViewController.swift
//  Chat
//
//  Created by Илья Павлов on 26.05.2026.
//

import UIKit
import Resources

class AuthViewController: UIViewController {
    
    
    private let googleButton = UIButton(
        title: String(localized: .loginEmailButton),
        titleColor: .black,
        backgroundColor: .white,
    )
    
    private let emailButton = UIButton(
        title: String(localized: .loginEmailButton),
        titleColor: .black,
        image: UIImage(systemName: "envelope"),
        backgroundColor: .white,
    )
    
    private let loginButton = UIButton(
        title: String(localized: .loginActionButton),
        titleColor: .systemGreen,
        backgroundColor: .black
    )
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}

#Preview {
    AuthViewController()
}
