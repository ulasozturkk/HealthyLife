import Foundation
import MapKit

struct User {
  var username: String
  var password: String
  var favPlaces: [FavPlaces]?
  var stats: String?
}

struct FavPlaces: Codable {
  var placeName: String
  var latitude: CLLocationDegrees
  var longitude: CLLocationDegrees
  var photos: [Data]?
  var people: [People]?

  enum CodingKeys: String, CodingKey {
    case placeName
    case latitude
    case longitude
    case photos
    case people
  }
}

struct People: Codable {
  var name: String
  var phoneNumber: String

  enum CodingKeys: String, CodingKey {
    case name
    case phoneNumber
  }

  func toDictionary() -> [String: Any] {
    return ["name": name, "phoneNumber": phoneNumber]
  }
}
