//
//  LoginCoordinator.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/20/24.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

final class LoginCoordinator: Coordinator {
    var rootVC: UIViewController?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController!) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.coordinator = self
        
        rootVC = viewController
        navigationController.viewControllers = [viewController]
    }
    
    func push(destination: LoginDestination) {
        switch destination {
        case .signup:
            let signupViewController = SignupViewController()
            signupViewController.coordinator = self
            navigationController.pushViewController(signupViewController, animated: false)
        case .findID:
            let findIDViewController = FindIDViewController()
            findIDViewController.coordinator = self
            navigationController.pushViewController(findIDViewController, animated: false)
        }
    }
    
    func login() {
        delegate?.didLoggedIn(self)
    }
}
