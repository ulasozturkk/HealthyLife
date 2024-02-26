
import UIKit

class FavPlacesView: BaseView {
  
  var backButton = customButton(backGroundColor: .white)
  var titleLabel = customLabel(text: "Fav Places", fontName: ConstantFonts.BoldItalic)
  var descriptionLabel = customLabel(text: "Click to edit and get directions", fontName: ConstantFonts.light)
  var tableView = UITableView()
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  
  override func buildSubViews() {
    backgroundColor = .white
    buildTitleLabel()
    buildDescriptionLabel()
    buildTableView()
  }
  
  private func buildTitleLabel(){
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.02).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  
  private func buildDescriptionLabel(){
    addSubview(descriptionLabel)
    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    descriptionLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildTableView(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = sH * 0.1
    addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    tableView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    tableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.9).isActive = true
    tableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
  }
    

}
