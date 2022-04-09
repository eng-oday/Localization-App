//
//  BackButton.swift
//  Hesabi
//
//  Created by Oday Dieg on 09/04/2022.
//

import UIKit

class BackButton: UIButton {


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
            if let image = UIImage(systemName: "arrow.backward")
            {
                setImage(image, for: .normal)
                tintColor   = .black
            }
        case .Arabic:
           
            if let image = UIImage(systemName: "arrow.forward")
            {
                setImage(image, for: .normal)
                tintColor   = .black
            }
        }
        
    }


}
