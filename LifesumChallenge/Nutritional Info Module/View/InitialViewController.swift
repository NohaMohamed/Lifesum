//
//  InitialViewController.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 11/07/2022.
//

import UIKit

class InitialViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var randomFoodBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomFoodBtn.addGradientLayer(colors: [Colors.btnFirstColor.cgColor,Colors.btnSecondColor.cgColor])
    }
    @IBAction func getRandomNutritionalInfo(_ sender: Any) {
        let randomFoodId = Int.random(in: 0..<50)
        let configurator = NutritionalInfoSceneConfigurator()
        let vc = configurator.configured(NutritionalInfoViewController())
        vc.foodId = randomFoodId
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
