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
        view.backgroundColor = .brown
        setupNavigationItem()
        setupLabel()
    }
    
    private func setupNavigationItem() {
        let backButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonDidTap))
        let findIDButtonItem = UIBarButtonItem(title: "아이디찾기", style: .plain, target: self, action: #selector(goToFindIDView))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.rightBarButtonItem = findIDButtonItem
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.text = "회원가입"
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
    
    @objc private func backButtonDidTap() {
        coordinator?.pop()
    }
    
    @objc private func goToFindIDView() {
        coordinator?.push(destination: .findID)
    }
    
}
