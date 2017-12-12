//
//  TextInputViewController.swift
//  Summarizer
//
//  Created by Ilias Basha on 12/12/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

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
    @IBOutlet var textContainerView: UIView!
    @IBOutlet var scanButton: UIButton!
    
    let defaulText = "Type or paste some text or a URL"

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    func setupViews() {
        textView.delegate = self
        shadowFor(view: textContainerView)
        shadowFor(view: scanButton)
        textView.text = defaulText
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














