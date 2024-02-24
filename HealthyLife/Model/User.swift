import Foundation
import MapKit

struct User {
  var email:String
  var username: String
  var password: String
  var favPlaces : [FavPlaces]?
  var stats: String?
}

struct FavPlaces {
  var location: CLLocationCoordinate2D
  var photos: [Data]?
  var people: [People]?
}

struct People {
  var firstName: String
  var lastName: String
  var phoneNumber: String
}
