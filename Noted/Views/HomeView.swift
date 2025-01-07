//
//  HomeView.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/10/31.
//

import SwiftData
import SwiftUI

struct HomeView: View {
	@Environment(\.modelContext) private var modelContext
	@Query private var notes: [Note]
	@State private var showingNewNote = false
	@State private var isEditing = false

	var body: some View {
		NavigationStack {
			NoteGridView(notes: notes) { note in
				withAnimation {
					modelContext.delete(note)
				}
			}
			.navigationTitle("Notes")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: { showingNewNote = true }) {
						Label("New Note", systemImage: "square.and.pencil")
					}
				}

				ToolbarItem(placement: .navigationBarLeading) {
					Button(isEditing ? "Done" : "Edit") {
						isEditing.toggle()
					}
				}
			}
			.environment(\.editMode, .constant(isEditing ? .active : .inactive))
		}
		.sheet(isPresented: $showingNewNote) {
			NavigationStack {
				NoteEditorView()
			}
		}
	}

	private func deleteNote(_ note: Note) {
		modelContext.delete(note)
	}
}

#Preview {
	HomeView()
		.modelContainer(for: Note.self, inMemory: true)
}
