//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Jobson on 18/05/25.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    private let navigationController: UINavigationController
    
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
        
        // Troca de navigationController
        window?.rootViewController = navigationController
    }
}
