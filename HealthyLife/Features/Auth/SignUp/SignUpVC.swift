

import UIKit

class SignUpVC: UIViewController {

  var sView: SignUpView?
  override func loadView() {
    sView = SignUpView()
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sView!.backButton)
    sView?.backButton.addTarget(self, action: #selector(goSignIn), for: .touchUpInside)
    sView?.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    view = sView
  }
  @objc func goSignIn(){
    navigationController?.popToRootViewController(animated: true)
  }
  @objc func signUp(){
    checkTextFields()
    guard let email = sView?.emailTextField.text,let password = sView?.passwordTextField.text else {return}
    SessionManager.shared.CreateAccount(email: email, password: password) { error in
      guard let error = error else {
        let alert = self.createAlert(title: "Success", message: "your account created succesfully")
        self.present(alert,animated: true)
        return
      }
      let alert = self.createAlert(title: "Error", message: error.localizedDescription)
      self.present(alert,animated: true)
    }
  }
  
  private func checkTextFields(){
    if sView?.emailTextField.text != "" && sView?.passwordTextField.text != "" && sView?.usernameTextField.text != "" && sView?.confirmTextField.text != "" {
      if sView?.passwordTextField.text == sView?.confirmTextField.text {
        
      }else {
        let alert = createAlert(title: "Error", message: "Passwords must be same!")
        self.present(alert,animated: true)
      }
    }else {
      let alert = createAlert(title: "Error", message: "Textfields can not be empty")
      self.present(alert,animated: true)
    }
  }
  func createAlert(title:String,message:String) -> UIAlertController{
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    alert.addAction(ok)
    return alert
  }
}
