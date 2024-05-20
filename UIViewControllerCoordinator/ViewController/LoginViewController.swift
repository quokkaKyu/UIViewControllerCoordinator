//
//  LoginViewController.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

final class LoginViewController: UIViewController {
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func loginButtonDidTap() {
        self.delegate?.login()
    }
}
