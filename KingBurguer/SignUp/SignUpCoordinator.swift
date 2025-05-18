//
//  SignUpCoodinator.swift
//  KingBurguer
//
//  Created by Jobson on 12/05/25.
//

import UIKit

class SignUpCoordinator {
    
    private var navigationController = UINavigationController()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .text
    }
    
    func start() {
        
        let viewModel = SignUpViewModel()
        viewModel.coordinator = self
        
        let signUpViewController = SignUpViewController()
        signUpViewController.viewModel = viewModel
        
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}
