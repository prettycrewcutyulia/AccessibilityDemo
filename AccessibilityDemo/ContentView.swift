//
//  ContentView.swift
//  AccessibilityDemo
//
//  Created by Юлия Гудошникова on 18.06.2024.
//

import SwiftUI

struct AccessibilitySwiftUIView: View {
    var body: some View {
        VStack {
            // Element with enhanced label for VoiceOver
            Text("Sample text")
                .accessibilityLabel("Readable text")
                .accessibilityHint("This is just a sample text on the screen.")
            
            Spacer().frame(height: 20)

            VoiceOverButtonView()
            
            Spacer().frame(height: 20)
            
            // Image with a descriptive label
            Image(systemName: "person.fill")
                .accessibilityLabel("Image of a person")
                .accessibilityAddTraits(.isImage)
                .accessibilityHint("This is a stylized image of a person.")
        }
        .padding()
        .navigationTitle("Accessibility Demo")
    }
}

struct VoiceOverButtonView: View {
    @State private var isPressed = false  // State to track button press

    var body: some View {
        VStack {
            Button(action: {
                // Toggle state on press
                self.isPressed.toggle()
            }) {
                Text("Press me")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(isPressed ? Color.blue : Color.red)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .accessibilityLabel(isPressed ? "Blue button" : "Red button")
            .accessibilityHint("Press to change the button color and hear it through VoiceOver.")
            .accessibilityAddTraits(.isButton)
            .animation(.easeInOut, value: isPressed)
        }
        .padding()
    }
}
