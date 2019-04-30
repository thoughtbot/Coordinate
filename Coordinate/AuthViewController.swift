import UIKit

protocol AuthViewControllerDelegate: AnyObject {
  func didSignIn()
}

final class AuthViewController: UIViewController {
  weak var delegate: AuthViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func signInPressed(_ sender: Any) {
    delegate?.didSignIn()
  }
}
