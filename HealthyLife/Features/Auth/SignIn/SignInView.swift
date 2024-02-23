

import UIKit

class SignInView: BaseView {
  var backButton = customButton(backGroundColor: .white)
  
  var iconImageView = customImageView(image: UIImage(named: "appIcon500.png")!)
  var LogInLabel = customLabel(text: "LogIn", fontName: ConstantFonts.BoldItalic, textColor: .black,fontSize: ConstantFontSize.title)
  var descriptionLabel = customLabel(text: "LogIn to continue using the app", fontName: ConstantFonts.light, textColor: .lightGray,fontSize: ConstantFontSize.description)
  var emailLabel = customLabel(text: "E-mail", fontName: ConstantFonts.SemiBoldItalic,fontSize: ConstantFontSize.subtitle)
  var emailTextField = customTextField(placeHolder: "Enter Your E-mail", isSecured: false)
  var passwordLabel = customLabel(text: "Password", fontName: ConstantFonts.SemiBoldItalic,fontSize: ConstantFontSize.subtitle)
  var passwordTextField = customTextField(placeHolder: "Enter Your Password", isSecured: true)
  var forgotPasswordLabel = customLabel(text: "Forgot Password?", fontName: ConstantFonts.italic,fontSize: ConstantFontSize.subtitle)
  var loginButton = customButton(title: "LogIn")
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  
  override func buildSubViews() {
    backgroundColor = .white
    buildIconImage()
    buildLogInLabel()
    buildDescriptionLabel()
    buildEmailLabel()
    buildEmailTextfield()
    buildPasswordLabel()
    buildPasswordTextfield()
    buildForgotPasswordLabel()
    buildLogInButton()
  }
  
  private func buildIconImage(){
    addSubview(iconImageView)
    iconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sH * 0.01).isActive = true
    iconImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    iconImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
    iconImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
  }
  private func buildLogInLabel(){
    addSubview(LogInLabel)
    LogInLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: sH * 0.02).isActive = true
    LogInLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sW * 0.05).isActive = true
    
  }
  private func buildDescriptionLabel(){
    addSubview(descriptionLabel)
    descriptionLabel.topAnchor.constraint(equalTo: LogInLabel.bottomAnchor, constant: sH * 0.01).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: sW * 0.05).isActive = true
  }
  private func buildEmailLabel(){
    addSubview(emailLabel)
    emailLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: sW * 0.05).isActive = true
  }
  private func buildEmailTextfield(){
    addSubview(emailTextField)
    emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    emailTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    emailTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    emailTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildPasswordLabel(){
    addSubview(passwordLabel)
    passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    passwordLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: sW * 0.05).isActive = true
  }
  private func buildPasswordTextfield(){
    addSubview(passwordTextField)
    passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier:  0.08).isActive = true
    passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier:  0.9).isActive = true
  }
  private func buildForgotPasswordLabel(){
    addSubview(forgotPasswordLabel)
    forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: sH * 0.02).isActive = true
    forgotPasswordLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -(sW * 0.05)).isActive = true
  }
  private func buildLogInButton(){
    addSubview(loginButton)
    loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: sH * 0.02).isActive = true
    loginButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    loginButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    loginButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
}
