//
//  NoteGridView.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/12/31.
//

import SwiftData
import SwiftUI

struct NoteGridView: View {
	let notes: [Note]
	var onDelete: (Note) -> Void

	let columns = [
		GridItem(.adaptive(minimum: 160), spacing: 16)
	]

	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns, spacing: 16) {
				ForEach(notes) { note in
					NoteCardView(note: note)
						.contextMenu {
							Button(role: .destructive) {
								onDelete(note)
							} label: {
								Label("Delete", systemImage: "trash")
							}
						}
				}
			}
			.padding()
		}
		.navigationTitle("Notes")
	}
}

#Preview {
	let sampleNotes = [
		Note(title: "Meeting Notes", content: "Discuss quarterly goals and budget allocation."),
		Note(title: "Grocery List", content: "Milk, eggs, bread, and fruits."),
		Note(title: "SwiftUI Tips", content: "Learn about Grids, State Management, and Animations."),
		Note(title: "Workout Plan", content: "Monday: Chest and Back. Tuesday: Cardio and Abs."),
	]
	NoteGridView(notes: sampleNotes) { _ in }
}
