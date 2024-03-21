//  PrimaryButton.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var background = Color.mainColor
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(Color.mainColor)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
