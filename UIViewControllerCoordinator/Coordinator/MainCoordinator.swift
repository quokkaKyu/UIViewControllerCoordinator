//
//  MainCoordinator.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

final class MainCoordinator: Coordinator {
    var rootVC: UIViewController?
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.coordinator = self
        viewController.view.backgroundColor = .brown
        rootVC = viewController
        navigationController.viewControllers = [viewController]
    }
    
    func logout() {
        delegate?.didLoggedOut(self)
    }
}
