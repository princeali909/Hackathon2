//
//  PopUpView.swift
//  LoginScreen
//
//  Created by Sayed Yoseph Sadat on 1/18/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class PopUpView: UIView {
    @IBOutlet weak var TextBoxInput: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TextBoxInput.textColor = .lightGray
        TextBoxInput.text = "Please describe your problem."
    }
    
    func textViewEdit (textView: UITextView){
        if TextBoxInput.isFirstResponder{
            TextBoxInput.text = nil
            TextBoxInput.textColor = .white
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
