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
}
