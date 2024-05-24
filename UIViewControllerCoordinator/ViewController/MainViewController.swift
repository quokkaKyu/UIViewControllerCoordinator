//
//  MainViewController.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .gray
        setupNavigationItem()
        setupLabel()
    }
    
    private func setupNavigationItem() {
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        navigationItem.rightBarButtonItem = item
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.text = "메인"
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
    
    @objc private func logoutButtonDidTap() {
        coordinator?.logout()
    }
}
