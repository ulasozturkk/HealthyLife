

import UIKit

class FavPlacesCell: UITableViewCell {
  var placeNameLabel = customLabel(text: "", fontName: ConstantFonts.SemiBoldItalic)
  var latitudeLabel = customLabel(text: "Latitude: ", fontName: ConstantFonts.light)
  var longitudeLabel = customLabel(text: "Longitude: ", fontName: ConstantFonts.light)
  let sW = UIScreen.main.bounds.width
  let sH = UIScreen.main.bounds.height
  public var item: FavPlaces! {
    didSet {
      placeNameLabel.text = item.placeName
      let latitude = String(item.latitude)
      latitudeLabel.text = "Latitude : \(latitude)"
      let longitude = String(item.longitude)
      longitudeLabel.text = "Longitude : \(longitude)"
    }
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    buildPlaceNameLabel()
    buildLatitudeLabel()
    buildLongitudeLabel()
  }
  
  private func buildPlaceNameLabel() {
    addSubview(placeNameLabel)
    placeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: sH * 0.01).isActive = true
    placeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sW * 0.1).isActive = true
  }

  private func buildLatitudeLabel() {
    addSubview(latitudeLabel)
    latitudeLabel.topAnchor.constraint(equalTo: placeNameLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    latitudeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sW * 0.1).isActive = true
  }

  private func buildLongitudeLabel() {
    addSubview(longitudeLabel)
    longitudeLabel.topAnchor.constraint(equalTo: latitudeLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    longitudeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sW * 0.1).isActive = true
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
