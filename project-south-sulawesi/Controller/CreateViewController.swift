//
//  CreateViewController.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit
import CoreML

class CreateViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var multiples: [Int] = []
    
    let sentimentClassifier = CustomSentimentClassifier()
    
    var journalContents: [JournalPostModel] = [
        JournalPostModel(date: "Wednesday 16th, 2020", post: "I'm so happy today", sentiment: "positive"),
        JournalPostModel(date: "Wednesday 17th, 2020", post: "I'm so angry today", sentiment: "negative"),
        JournalPostModel(date: "Wednesday 18th, 2020", post: "I'm a horse", sentiment: "neutral")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func postButtonPressed(_ sender: UIBarButtonItem) {
        var tempContent = ""
        if let contentBody = textView.text {
            tempContent = contentBody
        }

        let date = Date()
        let daySuffix = findDaySuffix(from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d'\(daySuffix)', yyyy"

        var tempSentiment = ""
        let prediction = try! sentimentClassifier.prediction(text: tempContent)
        if prediction.label == "Pos" {
            tempSentiment = "positive"
        } else if prediction.label == "Neutral" {
            tempSentiment = "neutral"
        } else {
            tempSentiment = "negative"
        }
        
        let journalPost = JournalPostModel(date: dateFormatter.string(from: date), post: tempContent, sentiment: tempSentiment)
        journalContents.append(journalPost)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func findDaySuffix(from date: Date) -> String {
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
    
    func calculateEmotion() -> Int {
        for content in journalContents {
            if content.sentiment == "positive" {
                multiples.append(1)
            } else if content.sentiment == "negative" {
                multiples.append(-1)
            }
        }
        let sum = multiples.reduce(0, +)
        return sum
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
