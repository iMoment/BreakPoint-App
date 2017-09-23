//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 23/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var insertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.delegate = self
        insertButton.bindToKeyboard()
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func insertButtonPressed(_ sender: UIButton) {
        if inputTextView.text != nil && inputTextView.text != "Insert input here..." {
            insertButton.isEnabled = false
            DataService.instance.insertPost(withMessage: inputTextView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, insertComplete: { (isComplete) in
                if isComplete {
                    self.insertButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.insertButton.isEnabled = true
                    print("There was an error.")
                }
            })
        }
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
