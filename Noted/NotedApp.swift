//
//  NotedApp.swift
//  Noted
//
//  Created by Omid DolatKia on 2024/10/31.
//

import SwiftData
import SwiftUI

@main
struct NotedApp: App {
	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			Note.self
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

		do {
			return try ModelContainer(for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()

	var body: some Scene {
		WindowGroup {
			HomeView()
		}
		.modelContainer(sharedModelContainer)
	}
}
