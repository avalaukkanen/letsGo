//
//  Review.swift
//  letsGo
//
//  Created by Ava Laukkanen on 31/07/2024.
//

import Foundation
import SwiftUI

struct Review: Identifiable, Codable {
    let id = UUID()
    var title: String
    var content: String
    var imageData: Data? // Store image data

    init(title: String, content: String, image: UIImage? = nil) {
        self.title = title
        self.content = content
        self.imageData = image?.jpegData(compressionQuality: 1.0)
    }

    var image: UIImage? {
        if let imageData = imageData {
            return UIImage(data: imageData)
        }
        return nil
    }
}
