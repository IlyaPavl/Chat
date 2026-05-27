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
        configurationStyle: UIButton.Configuration = .glass(),
        image: UIImage? = nil,
        imageSize: CGSize? = nil,
        imagePadding: CGFloat = Layout.Spacing.s,
        imagePlacement: NSDirectionalRectEdge = .leading,
        backgroundColor: UIColor = .systemBackground,
        cornerStyle: UIButton.Configuration.CornerStyle = .large,
        title: String? = nil,
        foregroundColor: UIColor = .label,
        font: UIFont = Typography.buttonFont,
        symbolPointSize: CGFloat? = nil,
        symbolWeight: UIImage.SymbolWeight = .regular
    ) {
        var configuration = configurationStyle

        if let image {
            if let imageSize {
                configuration.image = image.thumbnail(fitting: imageSize)
            } else {
                configuration.image = image
            }
        }

        configuration.imagePadding = imagePadding
        configuration.imagePlacement = imagePlacement
        configuration.baseBackgroundColor = backgroundColor
        configuration.baseForegroundColor = foregroundColor
        configuration.cornerStyle = cornerStyle

        if let title {
            configuration.attributedTitle = AttributedString(
                title,
                attributes: AttributeContainer([
                    .font: font,
                    .foregroundColor: foregroundColor,
                ])
            )
        }

        if let symbolPointSize {
            configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(
                pointSize: symbolPointSize,
                weight: symbolWeight
            )
        }

        self.init(configuration: configuration)
    }
}
