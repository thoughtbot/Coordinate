// AuthCoordinator.swift

import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
  func didAuthenticate()
}

final class AuthCoordinator: Coordinator {
  private let navController: UINavigationController
  weak var delegate: AuthCoordinatorDelegate?

  init(navController: UINavigationController, delegate: AuthCoordinatorDelegate) {
    self.navController = navController
    self.delegate = delegate
  }

  func start() {
    let authVC = UIStoryboard.instantiateAuthViewController(delegate: self)
    navController.setViewControllers([authVC], animated: true)
  }
}

extension AuthCoordinator: AuthViewControllerDelegate {
  func didSignIn() {
    // Authenticate via API, etc...
    delegate?.didAuthenticate()
  }
}
