//  TriviaManager.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import SwiftUI
import Foundation
import Alamofire

class TriviaManager: ObservableObject {
    
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    init() {
        fetchTrivia()
    }
    
    func fetchTrivia() {
        AF.request("https://opentdb.com/api.php?amount=10&lang=pt-BR").responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(Trivia.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.index = 0
                        self.score = 0
                        self.progress = 0.00
                        self.reachedEnd = false
                        self.trivia = decodedData.results
                        self.length = self.trivia.count
                        self.setQuestion()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("Error fetching trivia: \(error)")
            }
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
