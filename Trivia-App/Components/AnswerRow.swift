//  AnswersRow.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import SwiftUI

struct AnswerRow: View {
    
    var answer: Answer
    @State private var isSelected = false
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? Color.customGreen : Color.customRed)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color.mainColor : .gray) : Color.mainColor)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? answer.isCorrect ? Color.customGreen : Color.customRed : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)

            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect:  false))
            .environmentObject(TriviaManager())
    }
}
