

import UIKit

class customButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(title: String){
    self.init(frame: .zero)
    setTitle(title, for: .normal)
    
  }
  
  convenience init(backGroundColor: UIColor){
    self.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    self.layer.cornerRadius = bounds.size.width / 2
   // let symbolImage = UIImage(systemName: symbolImageName)   # IOS 13 OR NEWER
    let symbolImage = UIImage(named: "backIcon.png")
    self.setImage(symbolImage, for: .normal)
    self.backgroundColor = backGroundColor
  }
  
  func configureButton(){
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 30
    backgroundColor = .purple
    tintColor = .white
    titleLabel?.font = UIFont.customScaledFont(fontName: ConstantFonts.SemiBoldItalic)
    titleLabel?.adjustsFontForContentSizeCategory = true
  }
}
