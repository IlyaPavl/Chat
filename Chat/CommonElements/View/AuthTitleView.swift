//
//  AuthTitleView.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit

final class AuthTitleView: UIView {
    let titleLabel: UILabel

    init(title: String, font: UIFont, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .center) {
        let label = UILabel()
        label.font = font
        label.textColor = .label
        label.text = title
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment

        self.titleLabel = label

        super.init(frame: .zero)

        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
