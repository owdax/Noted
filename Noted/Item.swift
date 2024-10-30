//
//  Item.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/10/31.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
