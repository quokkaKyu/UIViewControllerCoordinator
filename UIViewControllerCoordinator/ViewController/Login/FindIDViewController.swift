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
        let backButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonDidTap))
        let homeButtonItem = UIBarButtonItem(title: "홈으로", style: .plain, target: self, action: #selector(homeButtonDidTap))
        navigationItem.leftBarButtonItems = [backButtonItem, homeButtonItem]
    }
    
    @objc private func backButtonDidTap() {
        coordinator?.pop()
    }
    
    @objc private func homeButtonDidTap() {
        coordinator?.popToRootVC()
    }
}
