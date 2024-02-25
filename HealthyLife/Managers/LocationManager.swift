
import CoreLocation
import FirebaseAuth
import FirebaseFirestore
import Foundation

class LocationManager {
  static let shared = LocationManager()
  private init() {}
  
  let firestore = Firestore.firestore()
  func addPlace(data: [String: Any]) {
    let userCollectionRef = firestore.collection("users")
    if let currentUser = Auth.auth().currentUser {
      let userRef = userCollectionRef.document(currentUser.uid)
      let placesCollection = userRef.collection("places")
      placesCollection.addDocument(data: data)
    }
  }
  
  func getPlaces(completion: @escaping ([FavPlaces]) -> ()) {
    var places : [FavPlaces] = []
    let userCollectionRef = firestore.collection("users")
    if let currentUser = Auth.auth().currentUser {
      let userRef = userCollectionRef.document(currentUser.uid)
      let placesCollection = userRef.collection("places")
      placesCollection.getDocuments { docs, error in
        if let error = error {
        } else {
          if let documents = docs?.documents {
            for document in documents {
              let data = document.data()
              let jsonData = try? JSONSerialization.data(withJSONObject: data)
              let decodedData = try? JSONDecoder().decode(FavPlaces.self, from: jsonData!)
              places.append(decodedData!)
            }
          }
          completion(places)
        }
      }
    }
  }
  
  func updatePlace(data: [String: Any], latitude: CLLocationDegrees) {
    var docID = ""
    let userCollectionRef = firestore.collection("users")
    if let currentUser = Auth.auth().currentUser {
      let userRef = userCollectionRef.document(currentUser.uid)
      let placesCollection = userRef.collection("places")
      let query = placesCollection.whereField("latitude", isEqualTo: latitude).getDocuments { snapshot, error in
        if let error = error {}
        guard let documents = snapshot?.documents else { return }
        docID = documents.first!.documentID
        placesCollection.document(docID).setData(data, merge: true)
      }
    }
  }
}
