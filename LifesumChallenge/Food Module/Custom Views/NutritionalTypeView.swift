//
//  NutritionalTypeView.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import UIKit
enum NutritionalType{
    case carbs(value: String)
    case protein(value: String)
    case fat(value: String)
}
class NutritionalTypeView: UIView ,NibLoadable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var typePercentage: UILabel!
   
    // MARK: - Life Cycle Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadNibContent()
    }
    func configure(_ title: String,value: String)  {
        typeName.text = title
        typePercentage.text = value
    }
}
