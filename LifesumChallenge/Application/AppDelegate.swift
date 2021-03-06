//
//  AppDelegate.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 06/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        startFlow()
        
        return true
    }
    
    func startFlow() {
        let navigationController = UINavigationController(rootViewController: InitialViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
