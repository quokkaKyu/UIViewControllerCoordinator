//
//  Coordinator.swift
//  UIViewControllerCoordinator
//
//  Created by kyuminlee on 5/21/24.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var rootVC: UIViewController? { get }
    func start()
}

extension Coordinator {
    func pop(animated: Bool = true) {
        if navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
        }
    }
    
    func popToRootVC(animated: Bool = true) {
        guard let rootVC = rootVC else {
            return
        }
        navigationController.popToViewController(rootVC, animated: animated)
    }
}
