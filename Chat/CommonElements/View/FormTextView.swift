//
//  FormTextView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

/// Label + `UITextView` с авто-ростом по высоте.
final class FormTextView: UIView {
    let titleLabel: UILabel
    let textView: UITextView

    private let heightConstraint: NSLayoutConstraint
    private let minHeight: CGFloat
    private let maxHeight: CGFloat

    init(
        title: String,
        textView: UITextView,
        titleFont: UIFont = Typography.commonLabelFont,
        fieldSpacing: CGFloat = Layout.AuthFlow.labelToControl,
        minHeight: CGFloat = Layout.TextView.minHeight,
        maxHeight: CGFloat = Layout.TextView.maxHeight
    ) {
        let label = UILabel()
        label.font = titleFont
        label.textColor = .label
        label.text = title

        self.titleLabel = label
        self.textView = textView
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.heightConstraint = textView.heightAnchor.constraint(equalToConstant: minHeight)

        super.init(frame: .zero)

        textView.delegate = self
        styleTextView(textView)

        [label, textView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),

            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: fieldSpacing),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heightConstraint,
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateTextViewHeight()
    }
}

extension FormTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updateTextViewHeight()
    }
}

private extension FormTextView {
    func styleTextView(_ textView: UITextView) {
        textView.font = Typography.commonLabelFont
        textView.textColor = .label
        textView.backgroundColor = .clear
        textView.layer.cornerRadius = Layout.CornerRadius.textView
        textView.layer.borderWidth = Layout.TextView.borderWidth
        textView.layer.borderColor = UIColor.systemGray5.cgColor
        textView.textContainerInset = Layout.TextView.contentInset
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
    }

    func updateTextViewHeight() {
        let availableWidth = textView.bounds.width
        guard availableWidth > 0 else { return }

        let fittingHeight = textView.sizeThatFits(
            CGSize(width: availableWidth, height: .greatestFiniteMagnitude)
        ).height
        let clampedHeight = min(max(fittingHeight, minHeight), maxHeight)

        guard heightConstraint.constant != clampedHeight else { return }

        heightConstraint.constant = clampedHeight
        textView.isScrollEnabled = fittingHeight > maxHeight
        invalidateIntrinsicContentSize()
        superview?.setNeedsLayout()
        superview?.layoutIfNeeded()
    }
}
