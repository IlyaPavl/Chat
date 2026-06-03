//
//  AddProfilePhotoView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

final class AddProfilePhotoView: UIView {

    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .systemBrown
        return imageView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(
            configurationStyle: .prominentGlass(),
            image: UIImage(systemName: "plus.circle"),
            backgroundColor: .systemBrown,
            cornerStyle: .dynamic,
            symbolPointSize: Layout.AuthFlow.Profile.addProfilePhotoButtonSize,
            symbolColor: .white
        )
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AddProfilePhotoView {
    func setupUI() {
        [circleImageView, addButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        setupConstraints()
    }

    func setupConstraints() {
        let photoSize = Layout.AuthFlow.Profile.profilePhotoSize
        let buttonSize = Layout.AuthFlow.Profile.addProfilePhotoButtonSize
        let spacing = Layout.Spacing.s
        let centerOffset = (spacing + buttonSize) / 2

        NSLayoutConstraint.activate([
            circleImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -centerOffset),
            circleImageView.topAnchor.constraint(equalTo: topAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: photoSize),
            circleImageView.heightAnchor.constraint(equalToConstant: photoSize),
            circleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            addButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: spacing),
            addButton.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: buttonSize),
            addButton.heightAnchor.constraint(equalToConstant: buttonSize),
        ])
    }
}
