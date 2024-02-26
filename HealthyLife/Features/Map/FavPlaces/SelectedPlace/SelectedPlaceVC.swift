

import UIKit

class SelectedPlaceVC: UIViewController, DataTransferDelegate {
  var sView: SelectedPlaceView?
  var selectedPlace: FavPlaces?
  var allContacs: [People] = []
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  override func loadView() {
    sView = SelectedPlaceView()
    view = sView

    fetchContacs()

    FavPlacesVC().delegate = self
    sView?.PlacesCollectionView.delegate = self
    sView?.PlacesCollectionView.dataSource = self
    sView?.ContacsCollectionView.delegate = self
    sView?.ContacsCollectionView.dataSource = self
  }

  func fetchContacs() {
    ContacsManeger.shared.getContacs { contacs in
      self.allContacs = contacs
    }
  }

  func sendData(data: FavPlaces) {
    selectedPlace = data
  }
}

extension SelectedPlaceVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == sView?.PlacesCollectionView {
    } else {
      return allContacs.count
    }
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == sView?.PlacesCollectionView {
      let cell = sView?.PlacesCollectionView.dequeueReusableCell(withReuseIdentifier: PlacesCell.identifier, for: indexPath) as! PlacesCell
      return cell
    } else {
      let cell = sView?.ContacsCollectionView.dequeueReusableCell(withReuseIdentifier: ContacsCell.identifier, for: indexPath) as! ContacsCell
      cell.item = allContacs[indexPath.row]
      return cell
    }
  }
}

extension SelectedPlaceVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let numberOfColumns: CGFloat = 2
    let itemWidth = (collectionView.frame.width - (numberOfColumns - 1) * 10) / numberOfColumns
    let itemHeight = collectionView.frame.height * 0.5
    return CGSize(width: itemWidth, height: itemHeight)
  }

  // vertical
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
