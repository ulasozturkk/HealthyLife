

import UIKit

class tabBar: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let homeVC = MapHomeVC()
    let statsVC = StatsVC()
    let profileVC = ProfileVC()

    navigationItem.hidesBackButton = true
    let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
    lineView.backgroundColor = .orange

    tabBar.addSubview(lineView)
    viewControllers = [homeVC, statsVC, profileVC]

    homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "mapIcon"), tag: 0)
    statsVC.tabBarItem = UITabBarItem(title: "Health", image: UIImage(named: "statsIcon"), tag: 1)
    profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), tag: 2)
  }
}
