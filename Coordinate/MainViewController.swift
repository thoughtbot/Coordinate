import UIKit

protocol MainViewControllerDelegate: AnyObject {
  func didSignOut()
}

final class MainViewController: UIViewController {
  weak var delegate: MainViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func signOutPressed(_ sender: Any) {
    delegate?.didSignOut()
  }
}
