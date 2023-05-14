//
//  String.swift
//  Podcast
//
//  Created by Le Tong Minh Hieu on 16/04/2023.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
