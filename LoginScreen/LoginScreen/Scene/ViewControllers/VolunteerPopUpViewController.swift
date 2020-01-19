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
    
    @IBOutlet weak var Charity: UIImageView! {
        didSet {
            self.Charity.tappable = true
        }
    }
    
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
        
        self.Charity.callback = {
             // Some actions etc.
           print("pressed image")
            if let url = URL(string: "https://www.stjude.org/donate/pm.html?sc_dcm=254910857&sc_cid=kwp75473&source_code=IIQ190721002&ef_id=EAIaIQobChMIx7a8tb2Q5wIVah6tBh0C4g_eEAAYASAAEgLf1vD_BwE:G:s&s_kwcid=AL!4519!3!386681578030!e!!g!!st%20judes&gclid=EAIaIQobChMIx7a8tb2Q5wIVah6tBh0C4g_eEAAYASAAEgLf1vD_BwE") {
                UIApplication.shared.open(url)
            }
        }
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


public typealias SimpleClosure = (() -> ())
private var tappableKey : UInt8 = 0
private var actionKey : UInt8 = 1

extension UIImageView {
    
    @objc var callback: SimpleClosure {
        get {
            return objc_getAssociatedObject(self, &actionKey) as! SimpleClosure
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var gesture: UITapGestureRecognizer {
        get {
            return UITapGestureRecognizer(target: self, action: #selector(tapped))
        }
    }
    
    var tappable: Bool! {
        get {
            return objc_getAssociatedObject(self, &tappableKey) as? Bool
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tappableKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            self.addTapGesture()
        }
    }

    fileprivate func addTapGesture() {
        if (self.tappable) {
            self.gesture.numberOfTapsRequired = 1
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(gesture)
        }
    }

    @objc private func tapped() {
        callback()
    }
}
