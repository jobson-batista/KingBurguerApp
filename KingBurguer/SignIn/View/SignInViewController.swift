//
//  SignInViewController.swift
//  KingBurguer
//
//  Created by Jobson on 10/05/25.
//

import UIKit

class SignInViewController: UIViewController {
    
    private var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logoImage")
        logo.layer.cornerRadius = 20
        return logo
    }()
    
    private var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .white
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Entre com seu e-mail"
        return emailTextField
    }()
    
    private var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .white
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Entre com sua senha"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor.secondaryText, for: .normal)
        button.backgroundColor = .primaryButton
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.setTitleColor(UIColor.text, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerDidTap), for: .touchUpInside)
        return button
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    private var footerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Desenvolvido por jobson.dev 😎"
        label.textColor = .text
        label.numberOfLines = 1
        return label
    }()
    
    var signInViewModel: SignInViewModel? {
        didSet {
            signInViewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Quando o valor recido é um enum, é possível omitir o nome da enum
        // Ex: UIColor.white ou somente .white
        view.backgroundColor = .background
        setupHierarchy()
        setupConstraints()
        navigationItem.title = "Login"
    }
    
    func setupHierarchy() {
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(sendButton)
        stackView.addArrangedSubview(registerButton)
        
        stackView.addArrangedSubview(footerLabel)
        
        view.addSubview(stackView)
//        view.addSubview(footerLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 256),
            logoImageView.widthAnchor.constraint(equalToConstant: 256),
            
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            sendButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -80),
            sendButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 80),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -80),
            registerButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 80),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
//            footerLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            footerLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
        ])
    }
    
    // Evento de touch
    @objc func sendDidTap(_ sender: UIButton) {
        signInViewModel?.send()
    }
    
    @objc func registerDidTap(_ sender: UIButton) {
        signInViewModel?.goToSignUp()
    }

}

extension SignInViewController: SignInViewModelDelegate {
    
    // Observador (O.O)
    // Aqui o VC está monitorando o estado do ViewModel
    func viewModelDidChanged(state: SignInSate) {
        switch state {
        case .none:
            break
        case .loading:
            // mostrar progresso
            break
        case .goToHome:
            // navegar para a tela principal
            break
        case .error(let msg):
            let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
            break
        }
    }
}
