//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Sohil Shah on 3/10/24.
//

// Import the UIKit framework
// You're almost always going to need this when your referencing UI elements in your file
import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    var currentQuestionIndex = 0
    var correctAnswers = 0
    
    let triviaQuestions = [
        Question(questionText: "What is the capital of France?", answers: ["Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 1),
        Question(questionText: "What is 'O' on the periodic table?", answers: ["Hydrogen", "Oxygen", "Iron", "Osmium"], correctAnswerIndex: 2),
        Question(questionText: "Who wrote 'To Kill a Mockingbird'?", answers: ["Harper Lee", "J.D. Salinger", "F. Scott Fitzgerald", "Ernest Hemingway"], correctAnswerIndex: 1),
        Question(questionText: "The iPhone was created by which company?", answers: ["Google", "Microsoft", "Samsung", "Apple"], correctAnswerIndex: 4)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    func updateUI() {
        
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        questionLabel.text = currentQuestion.questionText
        questionNumber.text = "Question \(currentQuestionIndex + 1)/\(triviaQuestions.count)"
        
        // Make sure there are at least 4 answers in the current question
        if currentQuestion.answers.count >= 4 {
            button1.setTitle(currentQuestion.answers[0], for: .normal)
            button2.setTitle(currentQuestion.answers[1], for: .normal)
            button3.setTitle(currentQuestion.answers[2], for: .normal)
            button4.setTitle(currentQuestion.answers[3], for: .normal)
        } else {
            print("Error: Not enough answers for question \(currentQuestionIndex + 1)")
        }
        
    }

    
    
    
    @IBAction func pressOnButton(_ sender: UIButton) {
        
        let selectedAnswerIndex = sender.tag
        
        if selectedAnswerIndex == triviaQuestions[currentQuestionIndex].correctAnswerIndex {
            correctAnswers += 1 // Increment only if the selected answer is correct
        }

        if currentQuestionIndex < triviaQuestions.count - 1 {
            currentQuestionIndex += 1
            updateUI()
        } else {
            showCompletionAlert() // Show the score in an alert when the quiz ends
        }
        
    }
    
    
    func showCompletionAlert() {
        let alert = UIAlertController(title: "Quiz Complete", message: "\(correctAnswers)/\(triviaQuestions.count) right", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.restartQuiz()
        }))

        present(alert, animated: true)
    }
        
    func restartQuiz() {
        currentQuestionIndex = 0
        correctAnswers = 0
        updateUI()
    }
    
    
}
