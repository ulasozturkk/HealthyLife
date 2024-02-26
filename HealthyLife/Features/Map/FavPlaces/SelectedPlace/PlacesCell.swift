
import UIKit

class PlacesCell: UICollectionViewCell {
  static let identifier = "PlacesCell"
  private let image: UIImageView = {
    let iv = customImageView(image: UIImage(named: "question.jpeg")!, cornerRadius: 12)
    iv.tintColor = .white
    iv.backgroundColor = .blue
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    buildImageView()

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
 
  
  private func buildImageView() {
    addSubview(image)
    
    image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    image .centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
    image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
  }
}
