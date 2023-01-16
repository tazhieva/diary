//
//  SignUpViewController.swift
//  diary
//
//  Created by Акмарал Тажиева on 05.12.2022.
//

import UIKit

class SignUpViewController: UIViewController {


    
    private let headerView = AuthHeaderView(title: "Explore millions of stories")
    private let nameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signUpButton = CustomButton(title: "Sign up", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create account"
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)

        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height/5)
        nameField.frame = CGRect(x: 20, y: headerView.bottom, width: view.width-60, height: 50)
        emailField.frame = CGRect(x: 20, y: nameField.bottom+10, width: view.width-60, height: 50)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width-60, height: 50)
        signUpButton.frame = CGRect(x: 20, y: passwordField.bottom+20, width: view.width-60, height: 50)
        
    }
    
    @objc func didTapSignUp() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let name = nameField.text, !name.isEmpty else {
            return
        }

        HapticsManager.shared.vibrateForSelection()

        // Create User
        AuthManager.shared.signUp(email: email, password: password) { [weak self] success in
            if success {
                // Update database
                let newUser = User(name: name, email: email, profilePictureRef: nil)
                DatabaseManager.shared.insert(user: newUser) { inserted in
                    guard inserted else {
                        return
                    }

                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(name, forKey: "name")
                    
                    DispatchQueue.main.async {
                        let vc = TabBarViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                    }
                }
            } else {
                print("Failed to create account")
            }
        }
    }
    
   
}
