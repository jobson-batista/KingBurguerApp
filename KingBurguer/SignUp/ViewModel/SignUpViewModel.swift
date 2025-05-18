//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Jobson on 18/05/25.
//

import Foundation

protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpSate)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpSate = SignUpSate.none {
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
    
}
