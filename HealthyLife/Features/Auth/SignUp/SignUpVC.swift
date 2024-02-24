

import UIKit

class SignUpVC: UIViewController {

  var sView: SignUpView?
  override func loadView() {
    sView = SignUpView()
    navigationController?.navigationBar.isHidden = true
    view = sView
  }

}
