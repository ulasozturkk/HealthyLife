

import UIKit

class ProfileVC: UIViewController {
  var sView: ProfileView?

  override func loadView() {
    sView = ProfileView()
    view = sView
  }
}
