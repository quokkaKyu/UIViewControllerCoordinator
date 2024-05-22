//
//  SignupViewController.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

final class SignupViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let backButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonDidTap))
        let findIDButtonItem = UIBarButtonItem(title: "아이디찾기", style: .plain, target: self, action: #selector(goToFindIDView))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.rightBarButtonItem = findIDButtonItem
    }
    
    @objc private func backButtonDidTap() {
        coordinator?.pop()
    }
    
    @objc private func goToFindIDView() {
        coordinator?.push(destination: .findID)
    }
    
}
