
import UIKit

class customStackView: UIStackView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureStackView()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  func configureStackView(){
    translatesAutoresizingMaskIntoConstraints = false
    axis = .vertical
//    alignment = .center
    distribution = .equalSpacing
  }
}
