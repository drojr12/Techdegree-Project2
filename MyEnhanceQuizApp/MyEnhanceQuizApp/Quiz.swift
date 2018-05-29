//
//  Quiz.swift
//  MyEnhanceQuizApp
//
//  Created by David Oliveira on 5/26/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

struct Quiz {
    // Properties for the Quiz.  Static property to keep a track of the currentQuestionIndex
    var questions: [Question]
    static var currentQuestionIndex = 0
    var questionsAsked = 0
    var hasBeenRead = false
    var correctQuestions = 0
    
    init() {
        let question1 = Question(questionAnswers: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"], correctAnswer: "Franklin D. Roosevelt", question: "Who was the only US President to serve more than two consecutive terms?")
        
        let question2 = Question(questionAnswers: ["Nigeria", "Russia", "Iran", "Vietnam"], correctAnswer: "Nigeria", question: "Which of the following countries has the most residents?")
        
        let question3 = Question(questionAnswers: ["1918", "1919", "1945", "1954"], correctAnswer: "1945", question: "In what year was the United Nations founded?")
        
        let question4 = Question(questionAnswers: ["Paris", "Washington D.C.", "New York City", "Boston"], correctAnswer: "New York City", question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?")
        
        let question5 = Question(questionAnswers: ["Iran", "Iraq", "Brazil", "Canada"], correctAnswer: "Canada", question: "Which nation produces the most oil?")
        
        let question6 = Question(questionAnswers: ["Italy", "Brazil", "Argentina", "Spain"], correctAnswer: "Brazil", question: "Which country has most recently won consecutive World Cups in Soccer?")
        
        let question7 = Question(questionAnswers: ["Yangtze", "Mississippi", "Congo", "Mekong"], correctAnswer: "Mississippi", question: "Which of the following rivers is longest?")
        
        let question8 = Question(questionAnswers: ["Mexico City", "Cape Town", "San Juan", "Sydney"], correctAnswer: "Mexico City", question: "Which city is the oldest?")
        
        let question9 = Question(questionAnswers: ["Poland", "United States", "Sweden", "Senegal"], correctAnswer: "Poland", question: "Which country was the first to allow women to vote in national elections?")
        
        let question10 = Question(questionAnswers: ["France", "Germany", "Japan", "Great Britain"], correctAnswer: "Great Britain", question: "Which of these countries won the most medals in the 2012 Summer Games?")
        
        self.questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
    }
}

