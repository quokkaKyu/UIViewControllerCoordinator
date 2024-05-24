# UIViewControllerCoordinator

<img src="/Resource/app.gif" width="30%" height="30%"/>

## 파일구조

![structure.png](/Resource/structure.png)
 
## 코드
- ### Coordinator.swift

```swift
import Foundation
import UIKit

// 화면 전환을 책임지는 coordinator protocol
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

```

- ### LoginDestination.swift

```swift
import Foundation

// Login Coordinator에서 이동할 뷰 정의
enum LoginDestination {
    case signup
    case findID
}

```

- ### AppCoordinator.swift

```swift
// Coordinator의 시작점 정의
final class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var rootVC: UIViewController?
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.delegate = self // MainCoordinator의 
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    // 로그인하면 MainCoordinator만 childCoordinators에 할당해주고 메인화면을 보여준다.
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator}
        showMainViewController()
    }
    
    // 로그아웃하면 LoginCoordinator만 childCoordinators에 할당해주고 로그인화면을 보여준다.
    func didLoggedOut(_ coordinator: MainCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showLoginViewController()
    }
}
```

- ### LoginCoordinator.swift

```swift
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
```

- ### MainCoordinator.swift

```swift
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
```

- ### SceneDelegate.swift

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController // rootview 설정
        let coordinator = AppCoordinator(navigationController: navigationController)
        coordinator.start()
        
        window?.makeKeyAndVisible()
    }
    ...
}
```

- ### LoginViewController.swift

```swift
final class LoginViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupNavigationItem()
        setupLabel()
    }
    
    private func setupNavigationItem() {
        let loginButtonitem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonDidTap))
        let findIDButtonItem = UIBarButtonItem(title: "아이디찾기", style: .plain, target: self, action: #selector(findIDButtonDidTap))
        let signupButtonItem = UIBarButtonItem(title: "회원가입", style: .plain, target: self, action: #selector(signupButtonDidTap))
        navigationItem.rightBarButtonItems = [loginButtonitem, findIDButtonItem, signupButtonItem]
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.text = "로그인"
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
    
    @objc private func loginButtonDidTap() {
        coordinator?.login()
    }
    
    @objc private func findIDButtonDidTap() {
        coordinator?.push(destination: .findID)
    }
    
    @objc private func signupButtonDidTap() {
        coordinator?.push(destination: .signup)
    }
}
```

## Reference
- https://zeddios.medium.com/coordinator-pattern-bf4a1bc46930
- https://khanlou.com/2015/01/the-coordinator/
- https://khanlou.com/2015/10/coordinators-redux/
