
import UIKit

class customTextField: UITextField {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureTextField()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(placeHolder: String, isSecured: Bool) {
    self.init(frame: .zero)
    self.placeholder = placeHolder
    self.isSecureTextEntry = isSecured
  }
  
  func configureTextField() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 20
    layer.borderWidth = 1.0
    layer.borderColor = UIColor.black.cgColor
    layer.masksToBounds = true
    textAlignment = .center
  }
}
