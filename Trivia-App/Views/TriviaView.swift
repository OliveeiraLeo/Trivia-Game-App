//  TriviaView.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import SwiftUI

struct TriviaView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager

    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .defaultTitle()

                Text("Congrats, you completed the game! 🥳")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    Task.init {
                        triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .foregroundColor(Color.mainColor)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondColor)
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
