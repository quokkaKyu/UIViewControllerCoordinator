//
//  MainViewController.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

final class MainViewController: UIViewController {
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func logoutButtonDidTap() {
        self.delegate?.logout()
    }
}
