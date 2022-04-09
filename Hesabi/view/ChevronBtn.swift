//
//  ChevronBtn.swift
//  Hesabi
//
//  Created by Oday Dieg on 09/04/2022.
//

import UIKit

class ChevronBtn: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ChangeBackBtnBasedOnLanguage()
    }
    
    private func ChangeBackBtnBasedOnLanguage(){
        
        guard let lang =  LocalizationManager.shared.getLanguage()else{
            return
        }
        
        switch lang {
        case .English:
            if let myImage = UIImage(systemName: "chevron.backward")
            {
                image       = myImage
                tintColor   = .black
            }
        case .Arabic:
            
            if let myImage = UIImage(systemName: "chevron.right")
            {
                image       = myImage
                tintColor   = .black
            }
        }
    }
    
    
}
