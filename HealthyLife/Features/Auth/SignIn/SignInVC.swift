
import UIKit

class SignInVC: UIViewController {
  var sView: SignInView?

  override func loadView() {
    sView = SignInView()
    view = sView
    let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    view.addGestureRecognizer(hideKeyboard)
    sView?.loginButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
    sView?.createAccountLabel.isUserInteractionEnabled = true
    let createAccount = UITapGestureRecognizer(target: self, action: #selector(goSignUp))
    sView?.createAccountLabel.addGestureRecognizer(createAccount)
  }
  
  @objc func hideKeyboard() {
    view.endEditing(true)
  }

  @objc func logIn() {
    guard let email = sView?.emailTextField.text, !email.isEmpty,
          let password = sView?.passwordTextField.text, !password.isEmpty else {
      let alert = createAlert(title: "Error", message: "E-mail and password cannot be empty")
      self.present(alert,animated: true)
      return
    }
    SessionManager.shared.SignIn(email: email, password: password) { error in
      if let error = error {
        let alert = self.createAlert(title: "Error", message: error.localizedDescription)
        self.present(alert,animated: true)
      }
    }
  }
  @objc func goSignUp(){
    navigationController?.pushViewController(SignUpVC(), animated: true)
  }
  
  
  func createAlert(title:String,message:String) -> UIAlertController{
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    alert.addAction(ok)
    return alert
  }
}
