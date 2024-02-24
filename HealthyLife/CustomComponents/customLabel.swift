

import UIKit

class customLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  convenience init(text:String,fontName:String,textColor: UIColor? = nil,fontSize: CGFloat){
    self.init(frame: .zero)
    self.text = text
    self.font = UIFont.customScaledFont(fontName: fontName)
    self.textColor = textColor ?? .black
    
  }
  
  func configureLabel(){
    translatesAutoresizingMaskIntoConstraints = false
    adjustsFontForContentSizeCategory = true
    numberOfLines = 3
  }
  
}
