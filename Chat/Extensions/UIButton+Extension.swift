//
//  UIButton+Extension.swift
//  Chat
//
//  Created by Илья Павлов on 26.05.2026.
//

import UIKit

extension UIButton {
    
    /// CommonButton configuration
    convenience init(
        title: String,
        titleColor: UIColor,
        image: UIImage? = nil,
        font: UIFont? = .commonButtonFont,
        backgroundColor: UIColor,
        cornerRadius: CGFloat = .commonButtonCornerRadius
    ) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
    }
}
