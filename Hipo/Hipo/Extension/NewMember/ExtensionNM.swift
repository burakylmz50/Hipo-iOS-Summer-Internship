//
//  Extension.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 23.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation
import UIKit


// Add done button on keyboard
extension UITextField{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

extension UITextField{
    @objc func textFieldDidChange(){
        self.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    }
}



extension UIButton {
    func buttonSetup(){
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 19, weight: .regular)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 10
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 0)
    }
}

extension UITextField {
    func underlined(placeHolder:String){
        self.layer.borderColor = UIColor(red:0.89, green:0.11, blue:0.22, alpha:1.00).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10
        self.textColor = UIColor.black
        self.layer.masksToBounds = false
        self.contentVerticalAlignment = .center
        self.textAlignment = .center
        self.autocorrectionType = .no
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 19, weight: .regular)
        ])
        self.addDoneButtonOnKeyboard()
        
    }
}

//Set Left Image in UITextField
extension UITextField {
    func setLeftImage(imageName:UIImage) {
        let padding = 10
        let size = 20
        let outerView = UIView(frame: CGRect(x: 20, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.contentMode = .scaleAspectFit
        iconView.image = imageName
        outerView.addSubview(iconView)
        leftView = outerView
        leftViewMode = .always
    }
}
