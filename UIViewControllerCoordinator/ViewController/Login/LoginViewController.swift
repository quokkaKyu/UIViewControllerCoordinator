//
//  LoginViewController.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupNavigationItem()
        setupLabel()
    }
    
    private func setupNavigationItem() {
        let loginButtonitem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonDidTap))
        let findIDButtonItem = UIBarButtonItem(title: "아이디찾기", style: .plain, target: self, action: #selector(findIDButtonDidTap))
        let signupButtonItem = UIBarButtonItem(title: "회원가입", style: .plain, target: self, action: #selector(signupButtonDidTap))
        navigationItem.rightBarButtonItems = [loginButtonitem, findIDButtonItem, signupButtonItem]
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.text = "로그인"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func loginButtonDidTap() {
        coordinator?.login()
    }
    
    @objc private func findIDButtonDidTap() {
        coordinator?.push(destination: .findID)
    }
    
    @objc private func signupButtonDidTap() {
        coordinator?.push(destination: .signup)
    }
}
