//
//  ButtonFormView.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit

final class ButtonFormView: UIView {
    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        
        [self, label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [label, button].forEach {
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Layout.Spacing.m),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: Layout.Button.height),
        ])
        
        bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
