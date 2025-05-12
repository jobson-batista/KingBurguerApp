//
//  SignUpCoodinator.swift
//  KingBurguer
//
//  Created by Jobson on 12/05/25.
//

import UIKit

class SignUpCoodinator {
    
    private var navigationController = UINavigationController()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signUpViewController = SignUpViewController()
        
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}
