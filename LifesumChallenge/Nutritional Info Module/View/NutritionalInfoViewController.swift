//
//  NutritionalInfoViewController.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import UIKit
protocol  NutritionalInfoPresenterToViewProtocol: AnyObject , LoadingViewProtocol{
    func showNutritionalInfo(_ model: NutritionalInfoViewModel)
    func showErrorView(title: String, subtitle: String)
}

class NutritionalInfoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var moreInfoBtn: UIButton!
    @IBOutlet weak var carbsView: NutritionalTypeView!
    @IBOutlet weak var proteinView: NutritionalTypeView!
    @IBOutlet weak var fatView: NutritionalTypeView!
    @IBOutlet weak var nutritionalOvalView: NutritionalOvalView!
    
    // MARK: - Dependencies
    
    var interactor: NutritionalInfoViewToInteractorProtocol?
    
    // MARK: - Properties
    
    // MARK: - Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let randomFoodId = Int.random(in: 0..<10)
        interactor?.fetchNutritionalInfo(randomFoodId)
    }
    private func setupUI(){
        moreInfoBtn.addGradientLayer(colors: [Colors.btnFirstColor.cgColor, Colors.btnSecondColor.cgColor])
    }

}
extension NutritionalInfoViewController : NutritionalInfoPresenterToViewProtocol {
    func showErrorView(title: String, subtitle: String) {
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNutritionalInfo(_ model: NutritionalInfoViewModel) {
        carbsView.configure(Localization.string(for: "carb_title"), value: model.carbs)
        proteinView.configure(Localization.string(for: "protein_title"), value: model.protein)
        fatView.configure(Localization.string(for: "fat_title"), value: model.fat)
        nutritionalOvalView.configure(name: model.name , calories: "\(model.calories)")
    }
}