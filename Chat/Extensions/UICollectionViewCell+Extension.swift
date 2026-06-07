//
//  UICollectionViewCell+Extension.swift
//  Chat
//
//  Created by Илья Павлов on 06.06.2026.
//

import UIKit

extension UICollectionViewCell {
    func applyRoundedStyle() {
        var background = UIBackgroundConfiguration.listCell()
        background.cornerRadius = Layout.CornerRadius.cell
        backgroundConfiguration = background
    }
}
