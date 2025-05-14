//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Jobson on 11/05/25.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController, ViewControllerProtocol {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private lazy var cpfTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "CPF"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var stackViewDateOfBirth: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de Nascimento"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var dateOfBirth: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        return datePicker
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
        
        
        setupHierarchy()
        setupConstraints()
        setupKeyboardObservers()
        setupDismissKeyboardOnTap()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stackViewDateOfBirth.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            stackViewDateOfBirth.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            
            fullNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            fullNameTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            cpfTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            cpfTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            cpfTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 40),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    func setupHierarchy() {
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(cpfTextField)
        
        stackViewDateOfBirth.addArrangedSubview(dateOfBirthLabel)
        stackViewDateOfBirth.addArrangedSubview(dateOfBirth)
        stackView.addArrangedSubview(stackViewDateOfBirth)
        
        stackView.addArrangedSubview(registerButton)
        
        contentView.addSubview(stackView)
        
        scrollView.addSubview(contentView)
        
        view.addSubview(scrollView)
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupDismissKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            scrollView.contentInset.bottom = keyboardFrame.height + 20
            print("Teclado apareceu")
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset.bottom = 0
        print("Teclado sumiu")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func registerDidTap(_ sender: UIButton) {
        
    }
    
}
