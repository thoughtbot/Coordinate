import UIKit

final class AppCoordinator: Coordinator {
  // MARK: - Properties
  private let navController: UINavigationController
  private let window: UIWindow
  private var childCoordinators: [Coordinator] = []

  // MARK: - Initializer
  init(navController: UINavigationController, window: UIWindow) {
    self.navController = navController
    self.window = window
  }

  func start() {
    window.rootViewController = navController
    window.makeKeyAndVisible()
    showMain()
  }

  // MARK: - Navigation
  private func showMain() {
    let mainVC = UIStoryboard.instantiateMainViewController(delegate: self)
    navController.setViewControllers([mainVC], animated: true)
    childCoordinators.removeAll { $0 is AuthCoordinator }
  }

  private func showAuth() {
    let authCoordinator = AuthCoordinator(navController: navController, delegate: self)
    childCoordinators.append(authCoordinator)
    authCoordinator.start()
  }
}

// MARK: - MainViewControllerDelegate
extension AppCoordinator: MainViewControllerDelegate {
  func didSignOut() {
    showAuth()
  }
}

extension AppCoordinator: AuthCoordinatorDelegate {
  func didAuthenticate() {
    showMain()
  }
}
