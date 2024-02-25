

import UIKit

class FavPlacesVC: UIViewController {

  var sView: FavPlacesView?
  override func loadView() {
    sView = FavPlacesView()
    view = sView
  }

}
