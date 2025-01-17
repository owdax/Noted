//
//  NoteEditorView.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/12/31.
//

import SwiftData
import SwiftUI

struct NoteEditorView: View {
	@Environment(\.modelContext) private var modelContext
	@Environment(\.dismiss) private var dismiss

	@State private var title: String = ""
	@State private var content: String = ""

	var body: some View {
		NavigationStack {
			Form {
				TextField("Title", text: $title)
					.fontWeight(.semibold)
				NotedTextEditor(content: content)
						.frame(minHeight: 400)
			}
			.navigationTitle("New Note")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel") {
						dismiss()
					}
				}

				ToolbarItem(placement: .confirmationAction) {
					Button("Noted") {
						saveNote()
					}
					.disabled(title.isEmpty)
				}
			}
		}
	}

	private func saveNote() {
		let newNote = Note(title: title, content: content)
		modelContext.insert(newNote)
		dismiss()
	}
}

#Preview {
	NoteEditorView()
		.modelContainer(for: Note.self, inMemory: true)
}
