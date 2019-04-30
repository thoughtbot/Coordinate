import UIKit

final class AppCoordinator: Coordinator {
  // MARK: - Properties
  private let navController: UINavigationController
  private let window: UIWindow

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
  }

  private func showAuth() {
    let authVC = UIStoryboard.instantiateAuthViewController(delegate: self)
    navController.setViewControllers([authVC], animated: true)
  }
}

// MARK: - MainViewControllerDelegate
extension AppCoordinator: MainViewControllerDelegate {
  func didSignOut() {
    showAuth()
  }
}

extension AppCoordinator: AuthViewControllerDelegate {
  func didSignIn() {
    showMain()
  }
}
