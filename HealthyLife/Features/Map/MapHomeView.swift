

import UIKit
import MapKit

class MapHomeView: BaseView {
  
  var titleLabel = customLabel(text: "Home", fontName: ConstantFonts.BoldItalic)
  var favButton = customButton(angledTitle: "Favourite Places")
  var contacsButton = customButton(angledTitle: "Contacs")
  var mapView = MKMapView()
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width

  override func buildSubViews() {
    backgroundColor = .white
    mapView.translatesAutoresizingMaskIntoConstraints = false
    buildFavButton()
    buildContacsButton()
    buildMapView()
    
  }
  private func buildFavButton(){
    addSubview(favButton)
    favButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: sH * 0.02).isActive = true
    favButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.15).isActive = true
    favButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    favButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
  }
  private func buildContacsButton(){
    addSubview(contacsButton)
    contacsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.02).isActive = true
    contacsButton.leadingAnchor.constraint(equalTo: favButton.trailingAnchor, constant: sW * 0.1).isActive = true
    contacsButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    contacsButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
  }
  private func buildMapView(){
    addSubview(mapView)
    mapView.topAnchor.constraint(equalTo: favButton.bottomAnchor, constant: sH * 0.05).isActive = true
    mapView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    mapView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.8).isActive = true
    mapView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
