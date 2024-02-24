

import UIKit

class SignUpView: BaseView {
  var backButton = ConstantComponents.backButton
  var iconImageView = ConstantComponents.iconImageView
  
  var titleLabel = customLabel(text: "Create Account", fontName: ConstantFonts.BoldItalic, fontSize: ConstantFontSize.title)
  var descriptionLabel = customLabel(text: "Enter your personal information", fontName: ConstantFonts.light, textColor: .lightGray, fontSize: ConstantFontSize.description)
  var usernameLabel = customLabel(text: "Username", fontName: ConstantFonts.SemiBoldItalic, fontSize: ConstantFontSize.subtitle)
  var usernameTextField = customTextField(placeHolder: "Enter your username", isSecured: false)
  var emailLabel = customLabel(text: "E-mail", fontName: ConstantFonts.SemiBoldItalic, fontSize: ConstantFontSize.subtitle)
  var emailTextField = customTextField(placeHolder: "Enter your e-mail", isSecured: false)
  var passwordLabel = customLabel(text: "Password", fontName: ConstantFonts.SemiBoldItalic, fontSize: ConstantFontSize.subtitle)
  var passwordTextField = customTextField(placeHolder: "Enter your password", isSecured: true)
  var confirmLabel = customLabel(text: "Confirm Password", fontName: ConstantFonts.SemiBoldItalic, fontSize: ConstantFontSize.subtitle)
  var confirmTextField = customTextField(placeHolder: "Enter password again", isSecured: true)
  var signUpButton = customButton(title: "Sign Up")
  var stackView = customStackView()
  let sH = UIScreen.main.bounds.height
  let sW = UIScreen.main.bounds.width
  
  override func buildSubViews() {
    addSubview(stackView)
    stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    backgroundColor = .white
    buildIconImageView()
    buildTitleLabel()
    buildDescriptionLabel()
    buildUsernameLabel()
    buildUsernameTextfield()
    buildEmailLabel()
    buildEmailTextField()
    buildPasswordLabel()
    buildPasswordTextField()
    buildConfirmLabel()
    buildConfirmTextField()
    buildSignUpButton()
    buildStackView()
  }
  private func buildIconImageView(){
    addSubview(iconImageView)
    iconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    iconImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    iconImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
    iconImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
  }
  private func buildTitleLabel(){
    stackView.addArrangedSubview(titleLabel)

  }
  private func buildDescriptionLabel(){
    stackView.addArrangedSubview(descriptionLabel)
    
 
  }
  private func buildUsernameLabel(){
    stackView.addArrangedSubview(usernameLabel)
   
 
  }
  private func buildUsernameTextfield(){
    stackView.addArrangedSubview(usernameTextField)
    
    usernameTextField.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    usernameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    usernameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildEmailLabel(){
    stackView.addArrangedSubview(emailLabel)

  }
  private func buildEmailTextField(){
    stackView.addArrangedSubview(emailTextField)
    
    emailTextField.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    emailTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    emailTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildPasswordLabel(){
    stackView.addArrangedSubview(passwordLabel)

  }
  private func buildPasswordTextField(){
    stackView.addArrangedSubview(passwordTextField)
   
    passwordTextField.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    passwordTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    passwordTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildConfirmLabel(){
    stackView.addArrangedSubview(confirmLabel)

  }
  private func buildConfirmTextField(){
    stackView.addArrangedSubview(confirmTextField)
    
    confirmTextField.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    confirmTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    confirmTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  private func buildSignUpButton(){
    stackView.addArrangedSubview(signUpButton)
    
    signUpButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    signUpButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
    signUpButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  func buildStackView(){
    stackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor).isActive = true
    stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    stackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor,multiplier: 0.75).isActive = true
    stackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
  }
  
}
