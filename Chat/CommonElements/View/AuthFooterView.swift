//
//  AuthFooterView.swift
//  Chat
//
//  Created by Илья Павлов on 02.06.2026.
//

import UIKit

/// Footer: текст слева, кнопка справа.
final class AuthFooterView: UIView {
    let titleLabel: UILabel
    let button: UIButton

    init(
        title: String,
        button: UIButton,
        titleFont: UIFont = Typography.commonLabelFont,
        itemSpacing: CGFloat = Layout.AuthFlow.footerItemSpacing
    ) {
        let label = UILabel()
        label.font = titleFont
        label.textColor = .label
        label.text = title
        label.numberOfLines = 0

        self.titleLabel = label
        self.button = button

        super.init(frame: .zero)

        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),

            button.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: itemSpacing),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Layout.Button.height),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
