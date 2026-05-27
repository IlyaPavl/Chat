//
//  Resources.swift
//  Resources
//
//  Created by Илья Павлов on 27.05.2026.
//

import Foundation

private final class BundleToken {}

public enum ResourcesBundle {
    public static let bundle: Bundle = Bundle(for: BundleToken.self)
}
