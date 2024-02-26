
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
    sView?.favButton.addTarget(self, action: #selector(goPlaces), for: .touchUpInside)
  }

  @objc func goPlaces() {
    navigationController?.pushViewController(FavPlacesVC(), animated: true)
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

  func getDirections(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
    let sourcePlacemark = MKPlacemark(coordinate: source)
    let destinationPlacemark = MKPlacemark(coordinate: destination)
    let sourceItem = MKMapItem(placemark: sourcePlacemark)
    let destinationItem = MKMapItem(placemark: destinationPlacemark)
    let request = MKDirections.Request()
    request.source = sourceItem
    request.destination = destinationItem
    request.transportType = .walking

    let directions = MKDirections(request: request)

    directions.calculate { response, _ in
      guard let route = response?.routes.first else { return }
      self.sView?.mapView.addOverlay(route.polyline, level: .aboveRoads)
      let region = MKCoordinateRegion(center: source, span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
      self.sView!.mapView.setRegion(region, animated: true)
    }
  }
}

extension MapHomeVC: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let pin = view.annotation as? MKPointAnnotation else { return }
    let alert = UIAlertController(title: pin.title, message: "Choose An Option", preferredStyle: .alert)
    let direction = UIAlertAction(title: "Get Direction", style: .cancel) { _ in
      if let userLocation = self.locationManager.location?.coordinate {
        self.getDirections(from: userLocation, to: pin.coordinate)
        
      }
    }
    let cancel = UIAlertAction(title: "Cancel", style: .destructive)
    alert.addAction(direction)
    alert.addAction(cancel)
    present(alert, animated: true)
  }

  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyLine = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyLine)
      renderer.strokeColor = UIColor.blue
      renderer.lineWidth = 3
      return renderer
    }
    return MKOverlayRenderer()
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
