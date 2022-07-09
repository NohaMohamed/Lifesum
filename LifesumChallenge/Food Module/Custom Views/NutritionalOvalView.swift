//
//  NutritionalOvalView.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import UIKit

class NutritionalOvalView: UIView,NibLoadable {
    //MARK: - Outlets
    
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodCalories: UILabel!
    // MARK: - Life Cycle Functions
    var gradientLayer = CAGradientLayer()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadNibContent()
        setupUI()
    }
    private func setupUI(){
        contentview.addGradientLayer(colors: [Colors.ovalFirstColor.cgColor,Colors.ovalSecondColor.cgColor])
        contentview.dropShadow(color: Colors.ovalShadowColor, alpha: 0.33)
    }
}
