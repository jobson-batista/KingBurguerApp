//
//  SignInCoordinator.swift
//  KingBurguer
//
//  Created by Jobson on 12/05/25.
//

import UIKit

class SignInCoordinator {
    
    private var window: UIWindow?
    private let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let signInVM = SignInViewModel()
        signInVM.coordinator = self
        
        let signInVC = SignInViewController()
        signInVC.signInViewModel = signInVM
        
        navigationController.pushViewController(signInVC, animated: true)
        
        // Retorna o retangulo referente ao tamanho da tela do iPhone --> windowScene.coordinateSpace.bounds
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible() // Tornar a tela visivel
    }
    
    func signUp() {
        let signUpCoordinator = SignUpCoodinator(navigationController: navigationController)
        signUpCoordinator.start()
    }
}
