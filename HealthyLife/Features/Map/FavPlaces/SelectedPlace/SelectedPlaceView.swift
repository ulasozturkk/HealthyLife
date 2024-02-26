

import UIKit

class SelectedPlaceView: BaseView {
  
   let PlacesCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.register(PlacesCell.self, forCellWithReuseIdentifier: PlacesCell.identifier)
    
    return collectionView
  }()
  
   let ContacsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.register(ContacsCell.self, forCellWithReuseIdentifier: ContacsCell.identifier)
    return collectionView
  }()
  
  let titleLabel = customLabel(text: "Contacs", fontName: ConstantFonts.BoldItalic)
  let descLabel = customLabel(text: "Drag and Drop to add contacs to cell", fontName: ConstantFonts.light)
  let addedContacsLabel = customLabel(text: "Added Contacs", fontName: ConstantFonts.SemiBoldItalic,textColor: .blue)
  let contacsLabel = customLabel(text: "All Contacs", fontName: ConstantFonts.SemiBoldItalic)
  
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  
  override func buildSubViews() {
    backgroundColor = .white
    buildTitleLabel()
    buildDescLabel()
    buildAddedLabel()
    buildPlacesCollectionView()
    buildContacsLabel()
    buildContacsCollectionView()
  }
  
  private func buildTitleLabel(){
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.02).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildDescLabel(){
    addSubview(descLabel)
    descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    descLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildAddedLabel(){
    addSubview(addedContacsLabel)
    addedContacsLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    addedContacsLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildPlacesCollectionView(){
    PlacesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(PlacesCollectionView)
    PlacesCollectionView.topAnchor.constraint(equalTo: addedContacsLabel.bottomAnchor,constant: sH * 0.01).isActive = true
    PlacesCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    PlacesCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
    PlacesCollectionView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
  }
  private func buildContacsLabel(){
    addSubview(contacsLabel)
    contacsLabel.topAnchor.constraint(equalTo: PlacesCollectionView.bottomAnchor, constant: sH * 0.02).isActive = true
    contacsLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
  }
  private func buildContacsCollectionView(){
    ContacsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(ContacsCollectionView)
    ContacsCollectionView.topAnchor.constraint(equalTo: contacsLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    ContacsCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    ContacsCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
    ContacsCollectionView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
  }
  
    

}
