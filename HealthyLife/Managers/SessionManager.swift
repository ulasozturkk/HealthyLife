

import Foundation
import FirebaseAuth

class SessionManager {
  static let shared = SessionManager()
  private init(){}
  var currentUser: User?
  
  func CreateAccount(email: String,password:String,username:String,completion:@escaping (Error?)-> () ){
    let auth = Auth.auth()
    auth.createUser(withEmail: email, password: password) { res, error in
      if let error = error {
        completion(error)
      }else {
        UserManager.shared.addUser(username: username, password: password, favPlaces: [], stats: [])
        completion(nil)
      }
    }
    
  }
  func SignIn(email:String,password:String,completion:@escaping (Error?) -> () ){
    let auth = Auth.auth()
    auth.signIn(withEmail: email, password: password) { res, error in
      if let error = error {
        completion(error)
        
      }else {
        completion(nil)
        
      }
    }
  }
}
