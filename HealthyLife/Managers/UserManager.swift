
import FirebaseAuth
import FirebaseFirestore
import Foundation

class UserManager {
  static let shared = UserManager()
  private init() {}
  
  let firestore = Firestore.firestore()
  // TODO: STAT UPDATE
  func addUser(username: String, password: String, favPlaces: [FavPlaces], stats: [String]) {
    let userCollectionRef = firestore.collection("users")
    if let currentUser = Auth.auth().currentUser {
      let userRef = userCollectionRef.document(currentUser.uid)
      
      userRef.getDocument { document, _ in
        if (document?.data()) != nil {
          self.updateUser(userRef: userRef, newData: [
            "username": username,
            "password": password,
            "favPlaces": favPlaces,
            "stats": stats
          ] as [String: Any])
        } else {
          self.createUser(userRef: userRef, userData: [
            "username": username,
            "password": password,
            "favPlaces": favPlaces,
            "stats": stats
          ] as [String: Any])
        }
      }
    }
  }
  
  private func updateUser(userRef: DocumentReference, newData: [String: Any]) {
    userRef.updateData(newData) { error in
      if let error = error {
        print("Güncelleme hatası: \(error)")
      } else {
        print("Kullanıcı belgesi başarıyla güncellendi.")
      }
    }
  }
  
  private func createUser(userRef: DocumentReference, userData: [String: Any]) {
    userRef.setData(userData) { error in
      if let error = error {
        print("Oluşturma hatası: \(error)")
      } else {
        print("Yeni kullanıcı belgesi başarıyla oluşturuldu.")
      }
    }
  }
}
