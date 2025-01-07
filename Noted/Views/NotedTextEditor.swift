//
//  NotedTextEditor.swift
//  Noted
//
//  Created by Omid DolatKia on 2025/1/7.
//

import SwiftUI

struct NotedTextEditor: View {
	@State var content = ""
	
	var body: some View {
		TextEditor(text: $content)
	}
}

#Preview {
    NotedTextEditor()
}
