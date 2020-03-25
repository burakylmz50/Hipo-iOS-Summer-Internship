//
//  ExtensionEM.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 24.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation
import UIKit


//Set Left Image in UITextField
extension UITextField {
    func setLeftImageEM(imageName:UIImage) {
        let padding = 10
        let size = 20
        let outerView = UIView(frame: CGRect(x: 20, y: 0, width: size+padding+10, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.contentMode = .scaleAspectFit
        iconView.image = imageName
        outerView.addSubview(iconView)
        leftView = outerView
        leftViewMode = .always
    }
}

extension UITextField {
    func underlinedEM(){
        self.layer.borderColor = UIColor(red:0.89, green:0.11, blue:0.22, alpha:1.00).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10
        self.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.textColor = UIColor.black
        self.layer.masksToBounds = false
        self.contentVerticalAlignment = .center
        self.textAlignment = .left
        self.autocorrectionType = .no
        self.addDoneButtonOnKeyboard()
        
    }
}

// TODO : Snap the picture inside the button to the right or left
extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 10)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
}
