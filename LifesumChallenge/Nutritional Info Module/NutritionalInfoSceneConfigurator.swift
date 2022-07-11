//
//  FoodConfigurator.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInfoSceneConfiguratorProtocol {
    func configured(_ vc: NutritionalInfoViewController) -> NutritionalInfoViewController
    
}
final class NutritionalInfoSceneConfigurator: NutritionalInfoSceneConfiguratorProtocol {
    
    @discardableResult
    
    func configured(_ vc: NutritionalInfoViewController) -> NutritionalInfoViewController {
        let repository = FoodRepository()
        let presenter = NutritionalInfoPresenter(view: vc)
        let interactor = NutritionalInfoInteractor(presenter: presenter, repository: repository)
        vc.interactor = interactor
        return vc
    }
}
