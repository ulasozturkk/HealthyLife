
import Foundation
import UIKit

extension UIFont {
  static func customScaledFont(fontName: String,fontSize: CGFloat) -> UIFont {
    let customFont = UIFont(name: fontName, size: fontSize)!
    let fontMetrics = UIFontMetrics.default
    let scaledFont = fontMetrics.scaledFont(for: customFont)
    return scaledFont
  }
}
