//
//  ViewController.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 06/07/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FoodRepository().getNutritionalInfo(2, compeletion: {[weak self] result in
            switch result{
            case .success(let info):
                print(info)
            case .failure(let error):
                print(error)
            }
        })
    }


}

