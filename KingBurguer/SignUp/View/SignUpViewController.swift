//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Jobson on 11/05/25.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController, ViewControllerProtocol {
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let fullNameTextField = UITextField()
        fullNameTextField.translatesAutoresizingMaskIntoConstraints = false
        fullNameTextField.placeholder = "Nome completo"
        fullNameTextField.borderStyle = .roundedRect
        fullNameTextField.backgroundColor = .white
        return fullNameTextField
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .white
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Nova senha"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .white
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private lazy var ufStatePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        navigationItem.title = "Criar Conta"
        navigationItem.titleView?.tintColor = .text
        
//        ufStatePickerView.delegate = self
//        ufStatePickerView.dataSource = self
        
        setupHierarchy()
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            fullNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            fullNameTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
//            ufStatePickerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
//            ufStatePickerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
//            ufStatePickerView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func setupHierarchy() {
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(registerButton)
        //stackView.addArrangedSubview(ufStatePickerView)
        
        view.addSubview(stackView)
    }
    
    @objc func registerDidTap(_ sender: UIButton) {
        
    }
    
}

extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BrazilianState.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BrazilianState.allCases[row].name
    }
}
