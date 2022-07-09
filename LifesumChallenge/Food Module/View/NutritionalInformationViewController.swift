//
//  NutritionalInformationViewController.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import UIKit
protocol  NutritionalInformationPresenterToViewProtocol: AnyObject {
    func showNutritionalInformation(_ model: NutritionalInfoViewModel)
}

class NutritionalInformationViewController: UIViewController {

    
    // MARK: - Dependencies
    
    var interactor: NutritionalInformationViewToInteractorProtocol?
    
    // MARK: - Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomFoodId = Int.random(in: 0..<10)
        interactor?.fetchNutritionalInformation(randomFoodId)
    }
    private func configure(){
        
    }

}
extension NutritionalInformationViewController : NutritionalInformationPresenterToViewProtocol {
    func showNutritionalInformation(_ model: NutritionalInfoViewModel) {
        
    }
}
