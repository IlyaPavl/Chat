//
//  UIImage+Extension.swift
//  Chat
//
//  Created by Илья Павлов on 27.05.2026.
//

import UIKit

extension UIImage {
    /// Вписывает изображение в `size`, пропорции сохраняются (`preparingThumbnail`).
    func thumbnail(fitting size: CGSize) -> UIImage {
        preparingThumbnail(of: size) ?? self
    }
}
