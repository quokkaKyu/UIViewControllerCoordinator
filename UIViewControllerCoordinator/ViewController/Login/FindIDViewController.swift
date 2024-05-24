//
//  FindIDViewController.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

final class FindIDViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .green
        setupNavigationItem()
        setupLabel()
    }
    
    private func setupNavigationItem() {
        let backButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonDidTap))
        let homeButtonItem = UIBarButtonItem(title: "홈으로", style: .plain, target: self, action: #selector(homeButtonDidTap))
        navigationItem.leftBarButtonItems = [backButtonItem, homeButtonItem]
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.text = "아이디찾기"
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
    
    @objc private func homeButtonDidTap() {
        coordinator?.popToRootVC()
    }
}
