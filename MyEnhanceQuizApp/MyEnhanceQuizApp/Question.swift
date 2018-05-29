//
//  Question.swift
//  MyEnhanceQuizApp
//
//  Created by David Oliveira on 5/26/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

struct Question {
    //Properties for holding an array of Strings for the possible answers, a correct answer string, and the question being asked.
    //Also has a boolean value to be marked if the question has been read before or not
    var questionAnswers: [String]
    var correctAnswer: String
    var question: String
    var hasBeenRead = false
    
    // Init method that passes through the values and sets them on the instance that creates them.
    init(questionAnswers: [String], correctAnswer: String, question: String) {
        self.questionAnswers = questionAnswers
        self.correctAnswer = correctAnswer
        self.question = question
    }
}

