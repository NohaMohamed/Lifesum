//
//  File.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
import UIKit
extension UIView {
    func addGradientLayer(colors: [CGColor]) {
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)

        self.layer.insertSublayer(gradient, at: 0)
    }
    func dropShadow(color: UIColor, alpha: Float){
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = alpha
            layer.shadowOffset = CGSize.zero
    }
    @IBInspectable
    var circulate: Bool{
        set{
            self.layer.cornerRadius = frame.size.width/2
            self.clipsToBounds = true}
        get{return self.circulate}
    }
    
    @IBInspectable
    var viewCornerRadius: CGFloat{
        set{self.layer.cornerRadius = newValue;self.clipsToBounds = true}
        get{return self.viewCornerRadius}
    }
}
extension UIButton{
    @IBInspectable
    var localizedTitle:String{
        get{
            return titleLabel?.text ?? ""
        }
        set{
            setTitle(Localization.string(for: newValue), for: .normal)
        }
    }
}
extension UILabel{
    
    @IBInspectable
    var localizedText:String{
        get{
            return text ?? ""
        }
        set{
            text = Localization.string(for: newValue)
        }
    }
}
