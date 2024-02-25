import Foundation
import MapKit

struct User {
  var username: String
  var password: String
  var favPlaces : [FavPlaces]?
  var stats: String?
}

struct FavPlaces {
  
  var placeName: String
  var latitude: CLLocationDegrees
  var longitude : CLLocationDegrees
  var photos: [Data]?
  var people: [People]?
}

struct People {
  var firstName: String
  var lastName: String
  var phoneNumber: String
}
