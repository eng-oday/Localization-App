//
//  LocalizationManager.swift
//  Hesabi
//
//  Created by Oday Dieg on 09/04/2022.
//

import Foundation
import UIKit



protocol LocalizationDelegate: class {
    func resetApp()
}

class LocalizationManager:NSObject {
    
    enum LanguageDirection {
        
        case leftToRight
        case rightToLeft
    }
    
    enum Language:String{
        case English = "en"
        case Arabic = "ar"
    }
    
    static let shared = LocalizationManager()
    private var bundle:Bundle? = nil
    private var languageKey = "UKPrefLang"
    weak var delegate: LocalizationDelegate?
    
    
    
    func getLanguage()->Language?{
        
        if let languageCode  = UserDefaults.standard.string(forKey: languageKey) , let language  = Language(rawValue: languageCode) {
            return language
    }
        return nil
}
    
    private func isLanguageAvailable(_ code:String)->Language?{
        
        var finalCode = ""
        if code.contains("ar"){
            finalCode = "ar"
        }else if code.contains("en")
        {
             finalCode = "en"
        }
        return Language(rawValue: finalCode)
    }
    
    
    private func getLanguageDirection()-> LanguageDirection{
        
        if let lang = getLanguage(){
            switch lang {
        case .English:
            return .leftToRight
        case .Arabic:
            return .rightToLeft
        }
        }
        return .leftToRight
    }
    
    func localizedString(for key:String , value comment:String)->String {
        
        let localized = bundle!.localizedString(forKey: key, value: comment, table: nil)
        return localized
            }
    
    func setLanguage(language:Language){
        
        UserDefaults.standard.set(language.rawValue, forKey: languageKey)
        if let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj"){
            bundle = Bundle(path: path)
        }else{
            resetLocalization()
        }
        UserDefaults.standard.synchronize()
        resetApp()
        
    }
    
    
    func resetLocalization(){
        bundle = Bundle.main
    }
    
    //reset app for the new language
    func resetApp(){
        let dir = getLanguageDirection()
        var semantic:UISemanticContentAttribute!
        switch dir {
        case .leftToRight:
             semantic = .forceLeftToRight
        case .rightToLeft:
             semantic = .forceRightToLeft
        }
        UIView.appearance().semanticContentAttribute = semantic
        delegate?.resetApp()
        
  
    }
    
    func setAppInitLanguage(){
        if let selectedLanguage = getLanguage(){
            setLanguage(language: selectedLanguage)
        }else{
             // no language selected
            let languageCode =  Locale.preferredLanguages.first
            
            if let code = languageCode , let language = isLanguageAvailable(code) {
                setLanguage(language: language)
            }else{
                //default  fall back
                setLanguage(language: .English)
            }
        }
        resetApp()
    }
}

extension String {
    
    var localized:String {
        return LocalizationManager.shared.localizedString(for: self, value: "")
    }
    
}
