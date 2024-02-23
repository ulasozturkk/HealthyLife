
import UIKit

class SignInVC: UIViewController {
  var sView: SignInView?

  override func loadView() {
    sView = SignInView()
    view = sView
  }
}
