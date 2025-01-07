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
			.font(.custom("HelveticaNeue", size: 15))
	}
}

#Preview {
    NotedTextEditor(content: "Hello my text editor!")
}
