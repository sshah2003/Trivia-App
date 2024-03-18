//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Sohil Shah on 3/16/24.
//

import Foundation


struct Question: Decodable {
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

//putting the questions into a array to pass into dataTask
struct TriviaQuestionsResponse: Decodable {
    let results: [Question]
}


class TriviaQuestionService {


    func fetchTriviaQuestions(amount: Int = 10, type: String? = nil, category: Int? = nil, difficulty: String? = nil, completion: (([TriviaQuestion]?) -> Void)! = nil) {
        
        
        var urlString = "https://opentdb.com/api.php?amount=\(amount)"
        
        if let type = type {
            urlString += "&type=\(type)"
        }
        if let category = category {
            urlString += "&category=\(category)"
        }
        if let difficulty = difficulty {
            urlString += "&difficulty=\(difficulty)"
        }
        
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                //parsing for JSON
                let response = try JSONDecoder().decode(TriviaQuestionsResponse.self, from: data)
                let questions = response.results.map { result -> TriviaQuestion in
                    // putting each item into TriviaQuestion
                    TriviaQuestion(
                        category: result.category,
                        question: result.question,
                        correctAnswer: result.correct_answer,
                        incorrectAnswers: result.incorrect_answers
                    )
                }
                completion(questions)
            } 
            catch {
                completion(nil)
            }
        }
        task.resume()
    }
}

