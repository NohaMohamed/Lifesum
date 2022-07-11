//
//  LoadingView.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 11/07/2022.
//

import Foundation
import UIKit

protocol LoadingViewProtocol {
    func showLoading()
    func hideLoading()
}

extension LoadingViewProtocol where Self: UIViewController {
    
    func showLoading() {
        let loader = LoadingView.shared
        view.addSubview(loader)
        view.bringSubviewToFront(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        loader.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        let loader = LoadingView.shared
        loader.removeFromSuperview()
    }
}

class LoadingView: UIView {
    
     var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tintColor = Colors.ovalSecondColor
        activityIndicator.color = Colors.ovalSecondColor
        return activityIndicator
    }()
    
    private init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        addSubview(activityIndicator)
        backgroundColor = .clear
        activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let shared = LoadingView()
}
