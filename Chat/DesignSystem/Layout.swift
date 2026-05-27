//
//  Layout.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import CoreGraphics

enum Layout {
    enum Spacing {
        
        /// Spacing = 8
        static let s: CGFloat = 8
        /// Spacing = 16
        static let m: CGFloat = 16
        /// Spacing = 24
        static let l: CGFloat = 24
        /// Spacing = 32
        static let xl: CGFloat = 32
        /// Spacing = 48
        static let xxl: CGFloat = 48
        /// Spacing = 64
        static let xxxl: CGFloat = 64
        /// Spacing = 80
        static let xxxxl: CGFloat = 80
    }

    enum CornerRadius {
        static let button: CGFloat = 12
    }

    enum Button {
        static let height: CGFloat = 50
        static let iconSize: CGFloat = 16
    }
    
    enum Login {
        static let logoHeight: CGFloat = 100
        static let logoFontSize: CGFloat = 50
        static let stackViewSpacing: CGFloat = 40
        static let loginViewSpacing: CGFloat = 150
    }
}
