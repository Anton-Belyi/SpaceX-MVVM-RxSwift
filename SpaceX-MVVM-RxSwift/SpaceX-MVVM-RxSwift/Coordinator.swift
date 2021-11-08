//
//  Coordinator.swift
//  SpaceX-MVVM-RxSwift
//
//  Created by Антон Белый on 07.11.2021.
//

import UIKit

class Coordinator {
        
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let mainViewController = ViewController()
        let navigationViewController = UINavigationController(rootViewController: mainViewController)
        navigationViewController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
    
}
