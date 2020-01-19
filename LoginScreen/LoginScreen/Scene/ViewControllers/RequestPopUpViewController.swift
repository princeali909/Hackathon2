//
//  RequestPopUpViewController.swift
//  LoginScreen
//
//  Created by Ali Halawa on 1/19/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class RequestPopUpViewController: UIViewController {

    var msg = ""
    let TAG = "MessagePopupWithButton"
    var onDoneBlock : ((Bool) -> Void)?
    let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 10, y: 10, width: 10, height: 10), type: NVActivityIndicatorType.ballPulse, color: UIColor.black, padding: 10.5)
    

    @IBOutlet weak var Confirm: UIButton!
    
    @IBOutlet weak var Text: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    
    
    @IBOutlet weak var Cancel: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Confirm.layer.cornerRadius = 10
        Confirm.clipsToBounds = true
        Cancel.layer.cornerRadius = 10
        Cancel.clipsToBounds = true
        
        Text.text = "How may we assist you?"
        Text.textColor = .black
        
        mainView.layer.cornerRadius = 4
        mainView.layer.masksToBounds = true
        mainView.clipsToBounds = true
        mainView.layer.borderWidth = 3
        //mainView.layer.borderColor = UIColor.red.cgColor
        
    }
    
    

    @IBAction func ConfirmClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func CancelClicked(_ sender: Any) {
        activityIndicatorView.startAnimating()
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Your code here
        
    }
    

}
