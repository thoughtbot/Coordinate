// UIStoryboard.swift

import UIKit

extension UIStoryboard {
  // MARK: - Storyboards
  private static var main: UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }

  private static var auth: UIStoryboard {
    return UIStoryboard(name: "Auth", bundle: nil)
  }

  // MARK: - View Controllers
  static func instantiateMainViewController(delegate: MainViewControllerDelegate) -> MainViewController {
    let mainVC = main.instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
    mainVC.delegate = delegate
    return mainVC
  }

  static func instantiateAuthViewController(delegate: AuthViewControllerDelegate) -> AuthViewController {
    let authVC = auth.instantiateViewController(withIdentifier: "authViewController") as! AuthViewController
    authVC.delegate = delegate
    return authVC
  }
}
