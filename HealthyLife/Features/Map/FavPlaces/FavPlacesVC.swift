

import UIKit

class FavPlacesVC: UIViewController {

  var sView: FavPlacesView?
  var favPlaces: [FavPlaces] = []
  override func loadView() {
    sView = FavPlacesView()
    view = sView
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.backButton)
    sView?.tableView.delegate = self
    sView?.tableView.dataSource = self
    sView?.tableView.register(FavPlacesCell.self, forCellReuseIdentifier: "PlacesCell")
    sView?.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    getPlaces()
  }
  
  @objc func goBack(){
    navigationController?.popViewController(animated: true)
  }
  func getPlaces() {
    LocationManager.shared.getPlaces { places in
      self.favPlaces = places
      DispatchQueue.main.async {
        self.sView?.tableView.reloadData()
      }
    }
    
  }
}

extension FavPlacesVC: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favPlaces.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = sView?.tableView.dequeueReusableCell(withIdentifier: "PlacesCell",for: indexPath) as! FavPlacesCell
    cell.item = favPlaces[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let deletePlace = favPlaces[indexPath.row]
      LocationManager.shared.deletePlace(latitude: deletePlace.latitude)
      favPlaces.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
}
