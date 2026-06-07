//
//  Layout.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit

enum Layout {
    enum Spacing {

        /// Spacing = 2
        static let xxs: CGFloat = 2
        /// Spacing = 4
        static let xs: CGFloat = 4
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
        static let cell: CGFloat = 12
        static let textView: CGFloat = 6
    }

    enum Button {
        static let height: CGFloat = 50
        static let iconSize: CGFloat = 16
    }

    enum TextField {
        static let height: CGFloat = 44
    }

    enum TextView {
        static let minHeight: CGFloat = 60
        static let maxHeight: CGFloat = 120
        static let borderWidth: CGFloat = 1
        static let contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    /// Общие отступы Auth / Login / SignUp.
    enum AuthFlow {
        static let topInset: CGFloat = Spacing.xxl
        static let horizontalInset = Spacing.xl
        static let headerToContent = Spacing.xxxxl
        static let sectionSpacing = Spacing.l
        static let footerTopSpacing = Spacing.xxl
        static let labelToControl = Spacing.m
        static let footerItemSpacing = Spacing.m
        static let footerBottomInset = Spacing.xxl
        
        enum Login {
            static let logoFontSize: CGFloat = 50
        }
        
        enum SignUp {
            static let welcomeLabelFontSize: CGFloat = 30
        }
        
        enum Profile {
            static let addProfilePhotoButtonSize: CGFloat = 30
            static let profilePhotoSize: CGFloat = 100
        }
    }
    
    enum Chats {
        static let avatarSize: CGFloat = 60

        enum waitingChats {
            static let groupSize: CGFloat = 80
        }
        
        enum activeChats {
            static let groupHeight: CGFloat = 60
        }
    }
}
