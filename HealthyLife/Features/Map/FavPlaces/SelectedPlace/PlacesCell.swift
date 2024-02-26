
import UIKit

class PlacesCell: UICollectionViewCell {
  static let identifier = "PlacesCell"
  private let image: UIImageView = {
    let iv = customImageView(image: UIImage(named: "profile.jpeg")!, cornerRadius: 12)
    iv.tintColor = .white
    iv.backgroundColor = .blue
    return iv
  }()
  private let nameLabel = customLabel(text: "", fontName: ConstantFonts.italic)
  private let phoneLabel = customLabel(text: "", fontName: ConstantFonts.light)
  
  public var item: People! {
    didSet{
      nameLabel.text = item.name
      phoneLabel.text = item.phoneNumber
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.borderColor = UIColor.blue.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = 12
    buildImageView()
    buildNameLabel()
    buildPhoneLabel()

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
 
  
  private func buildImageView() {
    addSubview(image)

    image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    image.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor).isActive = true
    image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4).isActive = true

  }
  private func buildNameLabel(){
    addSubview(nameLabel)
    nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
    nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
   
  }
  private func buildPhoneLabel(){
    addSubview(phoneLabel)
    phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    phoneLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    
  }
}
