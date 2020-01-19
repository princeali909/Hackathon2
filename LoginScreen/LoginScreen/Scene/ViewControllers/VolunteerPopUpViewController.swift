//
//  VolunteerPopUpViewController.swift
//  LoginScreen
//
//  Created by Ali Halawa on 1/19/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class VolunteerPopUpViewController: UIViewController {
    
    
    
    @IBOutlet weak var Davis: UILabel!
    
    @IBOutlet weak var AlexSmith: UILabel!
    
    @IBOutlet weak var helpyouwiththat: UILabel!
    
    @IBOutlet weak var HelpingHandFound: UILabel!
    
    @IBOutlet weak var Accept: UIButton!
    
    @IBOutlet weak var Decline: UIButton!
    
    @IBOutlet weak var Charity: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Davis.textColor = .black
        AlexSmith.textColor = .black
        helpyouwiththat.textColor = .black
        HelpingHandFound.textColor = .black
        
        
        Accept.layer.cornerRadius = 10
        Accept.clipsToBounds = true
        Decline.layer.cornerRadius = 10
        Decline.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func AcceptPressed(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DeclinePressed(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    

}
