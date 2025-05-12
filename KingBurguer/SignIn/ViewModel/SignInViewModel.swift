//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Jobson on 11/05/25.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInSate)
}

class SignInViewModel {
    
    var delegate: SignInViewModelDelegate?
    var coordinator: SignInCoordinator?
    
    var state: SignInSate = SignInSate.none {
        // é executado quando o estado da variavel mudar
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        state = .loading
        
        // Funcao para aguardar 2 segundos
        // Semelhante ao sleep() em python
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .error("Usuario nao existe")
        }
    }
    
    func goToSignUp() {
        coordinator?.signUp()
    }
}
