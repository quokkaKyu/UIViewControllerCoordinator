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
        let loginButtonitem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonDidTap))
        let findIDButtonItem = UIBarButtonItem(title: "아이디찾기", style: .plain, target: self, action: #selector(findIDButtonDidTap))
        let signupButtonItem = UIBarButtonItem(title: "회원가입", style: .plain, target: self, action: #selector(signupButtonDidTap))
        navigationItem.rightBarButtonItems = [loginButtonitem, findIDButtonItem, signupButtonItem]
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
