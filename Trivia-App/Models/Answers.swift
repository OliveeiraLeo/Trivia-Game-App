//  Answers.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
