//
//  FormFieldView.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit

final class FormFieldView: UIView {
    let titleLabel: UILabel
    let textField: UITextField

    init(
        title: String,
        textField: UITextField,
        titleFont: UIFont = Typography.commonLabelFont,
        fieldSpacing: CGFloat = Layout.AuthFlow.labelToControl
    ) {
        let label = UILabel()
        label.font = titleFont
        label.textColor = .label
        label.text = title

        self.titleLabel = label
        self.textField = textField

        super.init(frame: .zero)

        [label, textField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),

            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: fieldSpacing),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: Layout.TextField.height),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
