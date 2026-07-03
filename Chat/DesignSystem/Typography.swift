//
//  Typography.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import SwiftUI

enum Typography {
    static let buttonFont = Font.system(size: 16, weight: .semibold, design: .monospaced)
    static let loginLogoFont = Font.system(
        size: Layout.AuthFlow.Login.logoFontSize,
        weight: .black,
        design: .monospaced
    )
    static let welcomeLogoFont = Font.system(
        size: Layout.AuthFlow.SignUp.welcomeLabelFontSize,
        weight: .black,
        design: .monospaced
    )
    static let commonLabelFont = Font.system(size: 16, weight: .regular, design: .monospaced)
    static let commonTextFont = Font.system(size: 14, weight: .regular, design: .monospaced)
    static let supHeaderFont = Font.system(size: 25, weight: .heavy, design: .monospaced)
}
