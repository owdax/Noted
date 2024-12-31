//
//  NoteCardView.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/12/31.
//

import SwiftUI

struct NoteCardView: View {
	let note: Note

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(note.title)
				.font(.headline)
				.foregroundColor(.primary)
				.lineLimit(1)

			Text(note.content)
				.font(.subheadline)
				.foregroundColor(.secondary)
				.lineLimit(3)

			Spacer()
		}
		.padding()
		.background(Color(.systemBackground))
		.cornerRadius(12)
		.shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
	}
}

#Preview {
	let note = Note(title: "Hello, World!", content: "This is a sample note.")
	NoteCardView(note: note)
}
