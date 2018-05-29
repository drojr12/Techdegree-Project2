//
//  ViewController.swift
//  MyEnhanceQuizApp
//
//  Created by David Oliveira on 5/26/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    // Outlets for the labels and buttons
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Load the intitial game sound, and then display the Round information
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundMK.png")!)
        QuizManager.loadGameStartSound()
        QuizManager.playGameStartSound()
        QuizManager.displayRound(questionLabel: questionLabel, answerButton1: answerButton1, answerButton2: answerButton2, answerButton3: answerButton3, answerButton4: answerButton4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        //Increase the questionsAsked counter
        QuizManager.theQuiz.questionsAsked += 1
        
        //Logic for checking if the sender is the answerbutton & checking the current question to the current question's correct answer for each button.
        // If those two arguments are true, increase the correctQuestions property, load and play the sound, then run the helper method that advances the next round.
        if (sender === answerButton1 && QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].questionAnswers[0] == QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].correctAnswer) {
            
            QuizManager.theQuiz.correctQuestions += 1
            QuizManager.loadRightSound()
            QuizManager.playRightSound()
            print("You have the correct answer!")
            loadNextRound(delay: 3)
            
        } else if (sender === answerButton2 && QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].questionAnswers[1] == QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].correctAnswer) {
            
            QuizManager.theQuiz.correctQuestions += 1
            QuizManager.loadRightSound()
            QuizManager.playRightSound()
            print("You have the correct answer!")
            loadNextRound(delay: 3)
            
        } else if (sender === answerButton3 && QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].questionAnswers[2] == QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].correctAnswer) {
            
            QuizManager.theQuiz.correctQuestions += 1
            QuizManager.loadRightSound()
            QuizManager.playRightSound()
            print("You have the correct answer!")
            loadNextRound(delay: 3)
            
        } else if (sender === answerButton4 && QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].questionAnswers[3] == QuizManager.theQuiz.questions[Quiz.currentQuestionIndex].correctAnswer) {
            
            QuizManager.theQuiz.correctQuestions += 1
            QuizManager.loadRightSound()
            QuizManager.playRightSound()
            print("You have the correct answer!")
            loadNextRound(delay: 3)
            
        } else {
            QuizManager.loadWrongSound()
            QuizManager.playWrongSound()
            print("That is the wrong answer!")
            loadNextRound(delay: 3)
        }
    }
    
    //Helper Method
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            QuizManager.displayRound(questionLabel: self.questionLabel, answerButton1: self.answerButton1, answerButton2: self.answerButton2, answerButton3: self.answerButton3, answerButton4: self.answerButton4)
        }
    }
}

