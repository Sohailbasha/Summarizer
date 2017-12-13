//
//  SummaryViewController.swift
//  Summarizer
//
//  Created by Ilias Basha on 12/13/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import Reductio

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var text: String? {
        didSet {
            if let unwrappedText = self.text {
                Reductio.summarize(text: unwrappedText, compression: 0.7, completion: { (summary) in
                    let joinedString = summary.joined(separator: "\n")
                    print(joinedString)
                })
            }
        }
    }
    
    @IBOutlet var summaryTextView: UITextView!
    
    @IBAction func slide(_ sender: UISlider) {
    }
    
    func updateVC(text: String) {
        self.text = text
    }
    
    func summarize(text: String) {
        
    }
    

}
