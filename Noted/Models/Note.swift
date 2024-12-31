//
//  Note.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/12/31.
//

import Foundation
import SwiftData

@Model
final class Note: Identifiable {
	var id =  UUID()
	var title: String
	var content: String

	init(title: String, content: String) {
		self.title = title
		self.content = content
	}
}
