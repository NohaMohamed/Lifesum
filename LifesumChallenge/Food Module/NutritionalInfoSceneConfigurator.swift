//
//  FoodConfigurator.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInfoSceneConfiguratorProtocol {
    func configured(_ vc: NutritionalInformationViewController) -> NutritionalInformationViewController
    
}
final class NutritionalInfoSceneConfigurator: NutritionalInfoSceneConfiguratorProtocol {
    
    @discardableResult
    
    func configured(_ vc: NutritionalInformationViewController) -> NutritionalInformationViewController {
        let repository = FoodRepository()
        let presenter = NutritionalInformationPresenter(view: vc)
        let interactor = NutritionalInformationInteractor(presenter: presenter, repository: repository)
        vc.interactor = interactor
        return vc
    }
}
