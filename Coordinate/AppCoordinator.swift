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
    let mainVC = MainViewController()
    navController.setViewControllers([mainVC], animated: false)
  }
}

// MARK: - MainViewControllerDelegate
