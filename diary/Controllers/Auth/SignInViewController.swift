//
//  SignInViewController.swift
//  diary
//
//  Created by Акмарал Тажиева on 05.12.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    private let headerView = AuthHeaderView(title: "Explore millions of stories")
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let createAccountButton = CustomButton(title: "Create Account", fontSize: .med)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)

        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height/5)
        emailField.frame = CGRect(x: 20, y: headerView.bottom, width: view.width-60, height: 50)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width-60, height: 50)
        signInButton.frame = CGRect(x: 20, y: passwordField.bottom+20, width: view.width-60, height: 50)
        createAccountButton.frame = CGRect(x: 20, y: signInButton.bottom+10, width: view.width-60, height: 50)
    }
    
    @objc private func didTapSignInButton() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            return
        }
        
        AuthManager.shared.signIn(email: email, password: password) { [weak self] success in
            guard success else { return }
            DispatchQueue.main.async {
                UserDefaults.standard.set(email, forKey: "email")
                let vc = TabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
            }
        }
        
        
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = SignUpViewController()
        vc.title = "Create Account"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
