//  ContentView.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import SwiftUI

struct ContentView: View {
    
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                        .defaultTitle()
                    
                    Text("Ready to test your trivia skills?")
                        .foregroundColor(Color.mainColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(Color.secondColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
