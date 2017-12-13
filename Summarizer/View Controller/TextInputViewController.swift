//
//  TextInputViewController.swift
//  Summarizer
//
//  Created by Ilias Basha on 12/12/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import Reductio

class TextInputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var scanButton: UIButton!
    let defaulText = "Type or paste some text or a URL"

    @IBAction func buttonTapped(_ sender: Any) {
        if let text = textView.text {
            summarize(text: text, compression: 0.95, completion: { (summary) in
                print(summary)
            })
        }
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSummary" {
//            if let destinationVC = 
        }
    }
    
    

    
    func setupViews() {
        textView.delegate = self
//        shadowFor(view: textView)
        shadowFor(view: scanButton)
        textView.text = defaulText
        let inset: CGFloat = 15
        textView.textContainerInset = UIEdgeInsetsMake(inset, inset, inset, inset)
    }
    
    
    func shadowFor(view: UIView) {
        view.layer.cornerRadius = 5
        view.clipsToBounds = false
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize.init(width: 0, height: 4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension TextInputViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == defaulText) {
            textView.text = ""
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == "") {
            textView.text = defaulText
        }
        textView.resignFirstResponder()
    }
    
    
}














