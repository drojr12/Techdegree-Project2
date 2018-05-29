//
//  QuizManager.swift
//  MyEnhanceQuizApp
//
//  Created by David Oliveira on 5/26/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//
import AudioToolbox
import GameKit

class QuizManager {
    // static properties so I can have them globally available in the viewController
    static let questionsPerRound = 5
    static var questionCounter = 0
    static var gameSound: SystemSoundID = 0
    static var rightSound: SystemSoundID = 1
    static var wrongSound: SystemSoundID = 2
    static var theQuiz = Quiz()
    
    //Methods for loading the game sounds
    static func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "ElectricalSweeper", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    static func loadRightSound() {
        let path = Bundle.main.path(forResource: "RightSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &rightSound)
    }
    static func loadWrongSound() {
        let path = Bundle.main.path(forResource: "WrongSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &wrongSound)
    }
    //Methods for playing the sounds
    static func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    static func playRightSound() {
        AudioServicesPlaySystemSound(rightSound)
    }
    static func playWrongSound() {
        AudioServicesPlaySystemSound(wrongSound)
    }
    
    //Method for displaying Round information
    static func displayRound(questionLabel: UILabel, answerButton1: UIButton, answerButton2: UIButton, answerButton3: UIButton, answerButton4: UIButton) {
        
        // Get a random number for the questions Array Index to get a random question
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: theQuiz.questions.count)
        // Keep a globally available variable so I can tell what question is currently selected and set it each time the method is fired.
        Quiz.currentQuestionIndex = randomNumber
        
        // Logic for seeing if a question has been read & if questionCounter equals the questionsPerRound set
        // If it doesn't, it checks to see if the game is ended and updates the label, and hides button if so.
        // If it isn't, it sets up the corresponding Round information for the view
        if (theQuiz.questions[randomNumber].hasBeenRead == true && questionCounter != questionsPerRound) {
            displayRound(questionLabel: questionLabel, answerButton1: answerButton1, answerButton2: answerButton2, answerButton3: answerButton3, answerButton4: answerButton4)
            
        } else if questionCounter == questionsPerRound {
            questionLabel.text = "Game Over! You answered \(theQuiz.correctQuestions) out of \(questionsPerRound) questions correctly!"
            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            answerButton4.isHidden = true
            return
        } else {
            questionCounter += 1
            let randomQuestion = theQuiz.questions[randomNumber].question
            questionLabel.text = randomQuestion
            
            
            answerButton1.setTitle(theQuiz.questions[randomNumber].questionAnswers[0], for: .normal)
            answerButton2.setTitle(theQuiz.questions[randomNumber].questionAnswers[1], for: .normal)
            answerButton3.setTitle(theQuiz.questions[randomNumber].questionAnswers[2], for: .normal)
            answerButton4.setTitle(theQuiz.questions[randomNumber].questionAnswers[3], for: .normal)
            
            theQuiz.questions[randomNumber].hasBeenRead = true
        }
    }
}
