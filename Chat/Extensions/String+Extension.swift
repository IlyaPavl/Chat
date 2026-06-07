//
//  String+Extension.swift
//  Chat
//
//  Created by Илья Павлов on 05.06.2026.
//


extension String {
    var firstWord: String {
        split(separator: " ", omittingEmptySubsequences: true).first.map(String.init) ?? self
    }
}
