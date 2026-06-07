//
//  Typography.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit

enum Typography {
    static let buttonFont = UIFont.monospacedSystemFont(ofSize: 16, weight: .semibold)
    static let loginLogoFont = UIFont.monospacedSystemFont(ofSize: Layout.AuthFlow.Login.logoFontSize, weight: .black)
    static let welcomeLogoFont = UIFont.monospacedSystemFont(
        ofSize: Layout.AuthFlow.SignUp.welcomeLabelFontSize,
        weight: .black
    )
    static let commonLabelFont = UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)
    static let commonTextFont = UIFont.monospacedSystemFont(ofSize: 14, weight: .regular)
    static let supHeaderFont = UIFont.monospacedSystemFont(ofSize: 25, weight: .heavy)
}
