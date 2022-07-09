//
//  NutritionalTypeView.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import UIKit

class NutritionalTypeView: UIView ,NibLoadable {

    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var typePercentage: UILabel!
    // MARK: - Life Cycle Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadNibContent()
    }
}
