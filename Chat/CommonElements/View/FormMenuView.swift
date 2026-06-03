//
//  FormMenuView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

/// Label + кнопка с `UIMenu` (выбор из списка).
final class FormMenuView: UIView {
    
    let titleLabel: UILabel
    private let menuButton: UIButton
    
    var menu: UIMenu? {
        get { menuButton.menu }
        set { menuButton.menu = newValue }
    }
    
    init(
        title: String,
        placeholder: String,
        titleFont: UIFont = Typography.commonLabelFont,
        fieldSpacing: CGFloat = Layout.AuthFlow.labelToControl
    ) {
        let label = UILabel()
        label.font = titleFont
        label.textColor = .label
        label.text = title
        
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = placeholder
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = .label
        configuration.baseBackgroundColor = .systemBackground
        configuration.cornerStyle = .large
        
        button.configuration = configuration
        button.contentHorizontalAlignment = .leading
        button.showsMenuAsPrimaryAction = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        
        self.titleLabel = label
        self.menuButton = button
        
        super.init(frame: .zero)
        
        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: fieldSpacing),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: Layout.TextField.height),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func select(title: String) {
        menuButton.configuration?.title = title
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
