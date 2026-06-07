//
//  GradientView.swift
//  Chat
//
//  Created by Илья Павлов on 06.06.2026.
//

import UIKit

final class GradientView: UIView {
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing
        
        var point: CGPoint {
            switch self {
            case .topLeading: return CGPoint(x: 0, y: 0)
            case .leading: return CGPoint(x: 0, y: 0.5)
            case .bottomLeading: return CGPoint(x: 0, y: 1.0)
            case .top: return CGPoint(x: 0.5, y: 0)
            case .center: return CGPoint(x: 0.5, y: 0.5)
            case .bottom: return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing: return CGPoint(x: 1.0, y: 0.0)
            case .trailing: return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing: return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    
    init(from: Point, to: Point, startColor: UIColor, endColor: UIColor) {
        self.init()
        setupGradient(from: from, to: to, startColor: startColor, endColor: endColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient(from: Point, to: Point, startColor: UIColor, endColor: UIColor) {
        layer.addSublayer(gradientLayer)
        setupGradientColors(startColor: startColor, endColor: endColor)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
    }
    
    private func setupGradientColors(startColor: UIColor?, endColor: UIColor?) {
        if let startColor, let endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
