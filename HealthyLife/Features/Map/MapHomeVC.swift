
import MapKit
import UIKit

class MapHomeVC: UIViewController {
  var sView: MapHomeView?
  var locationManager = CLLocationManager()

  override func loadView() {
    sView = MapHomeView()
    view = sView
    sView?.mapView.delegate = self
    sView?.mapView.showsUserLocation = true
    sView?.mapView.isUserInteractionEnabled = true
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    let pinLocationRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(addPin))
    sView?.mapView.addGestureRecognizer(pinLocationRecognizer)
  }

  @objc func addPin(gestureRec: UILongPressGestureRecognizer) {
    if gestureRec.state != UIGestureRecognizer.State.ended {
      let touchLocation = gestureRec.location(in: sView?.mapView)
      let touchCoordinate = sView?.mapView.convert(touchLocation, toCoordinateFrom: sView?.mapView)

      let pin = MKPointAnnotation()
      if let touchCoordinate = touchCoordinate {
        pin.coordinate = touchCoordinate
        pin.title = "deneme"
        sView?.mapView.addAnnotation(pin)
      }
    }
  }
}

extension MapHomeVC: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let pin = view.annotation as? MKPointAnnotation else { return }

    let customizePin = UIAlertController(title: "Customize", message: "Add Title to this pin", preferredStyle: .alert)
    customizePin.addTextField { textfield in
      textfield.placeholder = "enter pin title:"
    }
    let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
    let okButton = UIAlertAction(title: "OK", style: .cancel) { _ in
      if let textField = customizePin.textFields?.first, let newTitle = textField.text {
        pin.title = newTitle
        view.annotation = pin
      }
    }
    customizePin.addAction(okButton)
    customizePin.addAction(cancelButton)

    present(customizePin, animated: true, completion: nil)

    sView!.mapView.deselectAnnotation(pin, animated: true)
  }
}

extension MapHomeVC: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
      // mevcut konumu aldık
      // region oluştur
      let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
      sView?.mapView.setRegion(region, animated: true)
    }
  }
}
