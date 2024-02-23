
import UIKit

class customImageView: UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureImageView()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(image: UIImage) {
    self.init(frame: .zero)
    self.image = image
  }
  
  convenience init(image: UIImage, cornerRadius: CGFloat) {
    self.init(frame: .zero)
    self.image = image
    layer.cornerRadius = cornerRadius
  }
  
  func configureImageView() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = bounds.size.width / 2
    clipsToBounds = false
    contentMode = .scaleAspectFill
    image = UIImage(named: "selectImage.jpeg")
  }
}
