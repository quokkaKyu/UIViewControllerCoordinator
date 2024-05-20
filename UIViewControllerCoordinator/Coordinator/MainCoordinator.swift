//
//  MainCoordinator.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

final class MainCoordinator: Coordinator, MainViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.delegate = self
        viewController.view.backgroundColor = .cyan
        self.navigationController.viewControllers = [viewController]
    }
    
    func logout() {
        self.delegate?.didLoggedOut(self)
    }
}
