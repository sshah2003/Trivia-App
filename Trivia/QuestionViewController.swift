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
    @IBOutlet var button: [UIButton]!
    
    var questionSelected = 0
    
    let triviaQuestions = [
        Question(questionText: "What is the capital of France?", answers: ["Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 0),
        Question(questionText: "What element does 'O' represent on the periodic table?", answers: ["Oxygen", "Gold", "Iron", "Osmium"], correctAnswerIndex: 0),
        Question(questionText: "Who wrote 'To Kill a Mockingbird'?", answers: ["Harper Lee", "J.D. Salinger", "F. Scott Fitzgerald", "Ernest Hemingway"], correctAnswerIndex: 0),
        Question(questionText: "The iPhone was created by which company?", answers: ["Apple", "Microsoft", "Samsung", "Google"], correctAnswerIndex: 0)
    ]

    
    
    
    @IBAction func pressOnButton(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
