

import CoreLocation
import UIKit

class SelectedPlaceVC: UIViewController, DataTransferDelegate {
  var sView: SelectedPlaceView?
  var selectedPlace: FavPlaces?
  var allContacs: [People] = []
  var selectedContacs: [People] = []
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  override func loadView() {
    sView = SelectedPlaceView()
    view = sView

    fetchContacs()

    FavPlacesVC().delegate = self
    sView?.PlacesCollectionView.delegate = self
    sView?.PlacesCollectionView.dataSource = self
    sView?.PlacesCollectionView.dropDelegate = self
    sView?.ContacsCollectionView.dragInteractionEnabled = true
    sView?.ContacsCollectionView.dragDelegate = self
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
      return selectedContacs.count
    } else {
      return allContacs.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == sView?.PlacesCollectionView {
      let cell = sView?.PlacesCollectionView.dequeueReusableCell(withReuseIdentifier: PlacesCell.identifier, for: indexPath) as! PlacesCell
      cell.item = selectedContacs[indexPath.row]
      return cell
    } else {
      let cell = sView?.ContacsCollectionView.dequeueReusableCell(withReuseIdentifier: ContacsCell.identifier, for: indexPath) as! ContacsCell
      cell.item = allContacs[indexPath.row]
      cell.isUserInteractionEnabled = true
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

extension SelectedPlaceVC: UICollectionViewDragDelegate {
  func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    let contactName = String(allContacs[indexPath.item].name)
    let contactNumber = String(allContacs[indexPath.item].phoneNumber)
    
    let nameItemProvider = NSItemProvider(object: contactName as NSString)
    let numberProvider = NSItemProvider(object: contactNumber as NSString)
    
    let nameDragItem = UIDragItem(itemProvider: nameItemProvider)
    let numberDragItem = UIDragItem(itemProvider: numberProvider)
    
    nameDragItem.localObject = contactName
    numberDragItem.localObject = contactNumber
    
    return [nameDragItem, numberDragItem]
  }
}

extension SelectedPlaceVC: UICollectionViewDropDelegate {
  func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    if collectionView === sView?.PlacesCollectionView {
      return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
    }
    return UICollectionViewDropProposal(operation: .forbidden)
  }
  
  func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
    var destinationIndexPath: IndexPath
    if let indexPath = coordinator.destinationIndexPath {
      destinationIndexPath = indexPath
    } else {
      let row = sView?.PlacesCollectionView.numberOfItems(inSection: 0) ?? 0
      destinationIndexPath = IndexPath(item: row - 1, section: 0)
    }
    
    if coordinator.proposal.operation == .copy {
      copyItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
    }
  }

  private func copyItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
    var data: [String] = []
    collectionView.performBatchUpdates {
      for (_, item) in coordinator.items.enumerated() {
        if collectionView === sView?.PlacesCollectionView {
          if let variable = item.dragItem.localObject as? String {
            data.append(variable)
          }
        }
      }
      let contact = People(name: data[0], phoneNumber: data[1])
      
      selectedContacs.append(contact)
      LocationManager.shared.updatePlace(data: ["people": selectedContacs.map { $0.toDictionary() }], latitude: selectedPlace!.latitude)

      collectionView.reloadSections(IndexSet(integer: 0))
      DispatchQueue.main.async {
        collectionView.reloadData()
      }
    }
  }
}
