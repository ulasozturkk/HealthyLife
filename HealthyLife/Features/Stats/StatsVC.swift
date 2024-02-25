
import UIKit

class StatsVC: UIViewController {

  var sView: StatsView?
  override func loadView() {
    sView = StatsView()
    view = sView
  }

}
