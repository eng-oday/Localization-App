//
//  ViewController.swift
//  Hesabi
//
//  Created by Oday Dieg on 08/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var hesabiLabel: UILabel!
    
    @IBOutlet weak var changeAccountLabel: UILabel!
    
    @IBOutlet weak var changePasswordLabel: UILabel!
    
    @IBOutlet weak var logOutLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var stopSubscribeLabel: UILabel!
    
    @IBOutlet weak var notificationsLabel: UILabel!
    
    
    var currentLang = Locale.current.languageCode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetLocalizations()

    }
    override func viewWillAppear(_ animated: Bool) {
      //  SetLocalizations()
    }
    
    private func SetLocalizations(){
        userNameLabel.text              = "userName".localized
        phoneNumberLabel.text           = "phoneNumber".localized
        hesabiLabel.text                = "myAccount".localized
        changeAccountLabel.text         = "editAccount".localized
        changePasswordLabel.text        = "changePassword".localized
        logOutLabel.text                = "logOut".localized
        settingsLabel.text              = "settings".localized
        stopSubscribeLabel.text         = "pauseSubscribe".localized
        notificationsLabel.text         = "notifications".localized
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        
    }

    
    @IBAction func ChangeLang(_ sender: Any) {
        
        if LocalizationManager.shared.getLanguage() == .Arabic
        {
            LocalizationManager.shared.setLanguage(language: .English)
            
        }else{
            LocalizationManager.shared.setLanguage(language: .Arabic)
        }
  
    }
}


