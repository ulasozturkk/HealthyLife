
import Foundation
import UIKit

extension UIFont {
  static func customScaledFont(fontName: String) -> UIFont {
    let customFont = UIFont(name: fontName, size: UIFont.labelFontSize)!
    let fontMetrics = UIFontMetrics.default
    let scaledFont = fontMetrics.scaledFont(for: customFont)
    return scaledFont
  }
}
