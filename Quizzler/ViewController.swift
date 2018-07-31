//  ViewController.swift
//  Quizzler
//
//  Created by Jesus Perez on June 19, 2018
//  Copyright (c) Jesus Perez Quizzler

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = questionBank() //Initialize a new questionBank class here
    
    var pickAnswer : Bool = false
    
    var questionNumber : Int = 0
    
    //Score variables
    var score : Int = 0
    
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion() //Brings up the first question text
        
    }

    //Buttons that are labeld as 'true' and 'false'
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickAnswer = true
        } else if sender.tag == 2{
            pickAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        //Adds the width the progress bar at the bottom!
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI() //Calls the score function!
            
        }   else  {
            
            let titleText: String = "Awesome"
            let message  : String = "Do you want to start over again?"
            
            //Alert action in swift with their actions performing
            let alert = UIAlertController(title: titleText, message: message, preferredStyle: .alert)
            
            //UI Alert action to restart when the button is pressed
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer //Gets the correct answer that holds the correct answer from the 1st question
        
        
        if  correctAnswer == pickAnswer  {
            ProgressHUD.showSuccess("Correct!")
            score += 1  //Adds 1 to score when user gets the right answer
            
        }   else    {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        
        nextQuestion()
        
        score = 0 
    }
    

    
}
