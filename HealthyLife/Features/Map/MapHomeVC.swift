
import MapKit
import UIKit

class MapHomeVC: UIViewController {
  var sView: MapHomeView?
  var locationManager = CLLocationManager()

  override func loadView() {
    sView = MapHomeView()
    view = sView
    checkFavPlaces()
    sView?.mapView.delegate = self
    sView?.mapView.showsUserLocation = true
    sView?.mapView.isUserInteractionEnabled = true
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    let pinLocationRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(addPin))
    sView?.mapView.addGestureRecognizer(pinLocationRecognizer)
  }

  func checkFavPlaces() -> [MKPointAnnotation] {
    var pins: [MKPointAnnotation] = []
    LocationManager.shared.getPlaces { places in
      DispatchQueue.main.async {
        for place in places {
          let pin = MKPointAnnotation()
          pin.title = place.placeName
          pin.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
          pins.append(pin)
        }
        let annotations = self.sView?.mapView.annotations
        self.sView?.mapView.removeAnnotations(annotations!)
        self.sView?.mapView.addAnnotations(pins)
      }
    }
    return pins
  }

  @objc func addPin(gestureRec: UILongPressGestureRecognizer) {
    if gestureRec.state != UIGestureRecognizer.State.ended {
      let touchLocation = gestureRec.location(in: sView?.mapView)
      let touchCoordinate = sView?.mapView.convert(touchLocation, toCoordinateFrom: sView?.mapView)

      let pin = MKPointAnnotation()
      let alertController = UIAlertController(title: "Enter Pin Title", message: nil, preferredStyle: .alert)

      alertController.addTextField { textField in
        textField.placeholder = "Pin Title"
      }
      let action = UIAlertAction(title: "OK", style: .cancel) { _ in
        if let title = alertController.textFields?.first?.text {
          if let touchCoordinate = touchCoordinate {
            pin.coordinate = touchCoordinate
            pin.title = alertController.textFields?.first?.text
            self.sView?.mapView.addAnnotation(pin)
            LocationManager.shared.addPlace(data: [
              "placeName": pin.title,
              "latitude": touchCoordinate.latitude,
              "longitude": touchCoordinate.longitude,
              "photos": [],
              "people": []
            ])
          }
        }
      }
      alertController.addAction(action)
      present(alertController, animated: true)
    }
  }
}

extension MapHomeVC: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let pin = view.annotation as? MKPointAnnotation else { return }
    let data = ["placeName": "bu bir denemdir"] as [String: Any]
    LocationManager.shared.updatePlace(data: data, latitude: pin.coordinate.latitude)
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
