//
//  LoginViewController.swift
//  Crypto Boost
//
//  Created by Rostyslav Mukoida on 12/02/2024.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    // MARK: - GUI Variables
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var particlesImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "particles")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("Log In".localised, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = linesColor
        button.layer.cornerRadius = 10
        button.layer.shadowColor = mainColor.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
        button.setTitleColor(UIColor.systemGray5, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTouchDown), for: .touchDown)
       // button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address".localised
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var emailErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = errorBorderColor
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Email address cannot be empty".localised
        label.isHidden = true
        return label
    }()
    
    private lazy var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = errorBorderColor
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Password cannot be empty".localised
        label.isHidden = true
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password".localised
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let field = UITextField()
        let attributesForField = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: fontColorDark]
        let attributedPlaceholder = NSAttributedString(string: "Enter your email address...".localised, attributes: attributesForField as [NSAttributedString.Key : Any])
        configureTextField(field)
        field.attributedPlaceholder = attributedPlaceholder
        field.keyboardType = .emailAddress
        field.isSecureTextEntry = false
        return field
    }()
    
    private lazy var passwordTextField: UITextField = {
        let field = UITextField()
        let attributesForField = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: fontColorDark]
        let attributedPlaceholder = NSAttributedString(string: "Enter your password...".localised, attributes: attributesForField as [NSAttributedString.Key : Any])
        configureTextField(field)
        field.attributedPlaceholder = attributedPlaceholder
        field.isSecureTextEntry = true
        return field
    }()
    
    private lazy var dontHaveAccLabel: UILabel = {
        let label = UILabel()
        label.textColor = fontColorDark
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "First time here?".localised
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.setTitle("Sign Up".localised, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTouchDown), for: .touchDown)
       // button.addTarget(self, action: #selector(signUpButtonTouchUp), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forgotPassButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.setTitle("Forgotten password?".localised, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(textColor, for: .normal)
       // button.addTarget(self, action: #selector(signUpButtonTouchDown), for: .touchDown)
       // button.addTarget(self, action: #selector(signUpButtonTouchUp), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var underLoginView: UIView = {
        let view = UIView()
        view.backgroundColor = linesColor
        
        return view
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.textColor = fontColorDark
        label.layer.backgroundColor = mainColor.cgColor
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "    OR    "//.localised
        return label
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("Continue with Google".localised, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderColor = fontColorDark.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(textColor, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTouchDown), for: .touchDown)
       // button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var appleButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.setTitle("Continue with Apple".localised, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderColor = fontColorDark.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(textColor, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTouchDown), for: .touchDown)
       // button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Properties
    private let cornerRadius: CGFloat = 10
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNeedsStatusBarAppearanceUpdate()
        configureUI()
        setupNavigationBar()
        setupConstraints()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveContentUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveContentBack), name: UIResponder.keyboardWillHideNotification, object: nil)
   
    }
    
    // MARK: - Private methods
    private var navigationBarColorSet = false
    
    private func setupNavigationBar() {
        let font = UIFont.systemFont(ofSize: 15.0, weight: .bold)
        let attributesNormal: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.systemOrange]
        let attributesHighlighted: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.systemOrange]
        let rightBarButtonItem = UIBarButtonItem(title: "Sign up".localised, style: .plain, target: self, action: #selector(toSignUp))
        rightBarButtonItem.setTitleTextAttributes(attributesNormal, for: .normal)
        rightBarButtonItem.setTitleTextAttributes(attributesHighlighted, for: .highlighted)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.title = "Sign in".localised
        
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = mainColor
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    private func configureTextField(_ field: UITextField){
        
        field.borderStyle = .roundedRect
        field.backgroundColor = mainColor
        field.layer.borderColor = linesColor.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = cornerRadius
        field.textColor = fontColorDark
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.tintColor = .systemOrange
       
    }
    
    private func configureUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(emailLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(emailErrorLabel)
        contentView.addSubview(passwordErrorLabel)
        contentView.addSubview(forgotPassButton)
        contentView.addSubview(underLoginView)
        contentView.addSubview(orLabel)
        contentView.addSubview(dontHaveAccLabel)
        contentView.addSubview(signUpButton)
        contentView.addSubview(googleButton)
        contentView.addSubview(appleButton)
        view.addSubview(particlesImageView)
        
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.backgroundColor = mainColor
    }
    // MARK: - Constraints
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
            make.bottom.equalTo(orLabel.snp.bottom).offset(10)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(-30)
        }
        
        particlesImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).inset(10)
            make.leading.equalToSuperview().offset(30)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.height.equalTo(50)
        }
        
        emailErrorLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.top.equalTo(emailTextField.snp.bottom).offset(4)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailErrorLabel)
            make.top.equalTo(emailErrorLabel.snp.bottom).offset(5)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(emailTextField)
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.centerY.equalTo(passwordLabel.snp.centerY)
        }
        
        passwordErrorLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.top.equalTo(passwordTextField.snp.bottom).offset(4)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordErrorLabel.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(45)
        }
        
        dontHaveAccLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(33)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerY.equalTo(dontHaveAccLabel.snp.centerY)
            make.leading.equalTo(dontHaveAccLabel.snp.trailing).offset(4)
        }
        
        underLoginView.snp.makeConstraints { make in
            make.top.equalTo(dontHaveAccLabel.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(1)
        }
        
        orLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(underLoginView.snp.centerY)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(45)
        }
        
        appleButton.snp.makeConstraints { make in
            make.top.equalTo(googleButton.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(45)
        }
        
        
        scrollView.contentSize = contentView.bounds.size
    }
    
    // MARK: - Actions
    @objc func moveContentUp (notification: NSNotification) {
        
        let userInfo = notification.userInfo
        let keyboardFrame = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        let keyboardHeight = keyboardFrame!.size.height
        let emptySpaceHight = view.frame.size.height - loginButton.frame.origin.y - loginButton.frame.size.height
        let coveredContentHeight = keyboardHeight - emptySpaceHight
        if(coveredContentHeight + 10 >= 0) {
            view.frame.origin.y = -coveredContentHeight - 10
        }
    }
    
    @objc func moveContentBack (notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    @objc private func toSignUp() {
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func signUpButtonTouchDown(sender: UIButton) {
        sender.alpha = 0.5
    }
    
    /*
      @objc func loginButtonTouchUp(sender: UIButton) {
          sender.alpha = 1.0
        
              if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                  appDelegate.window?.rootViewController = appDelegate.registerViewController
              }
      }*/
    
    @objc func loginButtonTouchDown(sender: UIButton) {
        sender.alpha = 0.5
    }
  /*
    @objc func loginButtonTouchUp(sender: UIButton) {
        sender.alpha = 1.0
      
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.window?.rootViewController = appDelegate.mainTabBar
            }
    }*/
}
    // MARK: - UITextFieldDelegate
    extension LoginViewController: UITextFieldDelegate {
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            updateLoginButtonState(textField)
            
            if let text = textField.text, !text.isEmpty {
                makeActiveLines(textField, color: UIColor.orange, hide: true)
                textField.tintColor = .systemOrange
            }
        }
        
        private func makeActiveLines(_ textField: UITextField, color: UIColor, hide: Bool) {
            textField.layer.borderColor = color.cgColor
            textField.layer.borderWidth = 1.5
            if textField == emailTextField {
                emailErrorLabel.isHidden = hide
            } else if textField == passwordTextField {
                passwordErrorLabel.isHidden = hide
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            if textField.layer.borderColor == linesColor.cgColor {
                textField.layer.borderColor = UIColor.systemOrange.cgColor
                textField.layer.borderWidth = 1.5
            }

            else if let text = textField.text, !text.isEmpty {
                makeActiveLines(textField, color: UIColor.orange, hide: true)
                textField.tintColor = .systemOrange
            } else {
                makeActiveLines(textField, color: errorBorderColor, hide: false)
                textField.tintColor = errorBorderColor
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            
            if let text = textField.text, text.isEmpty {
                makeActiveLines(textField, color: errorBorderColor, hide: false)
            } else {
                makeActiveLines(textField, color: linesColor, hide: true)
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            if let text = textField.text, text.isEmpty {
                makeActiveLines(textField, color: errorBorderColor, hide: false)
            } else {
                makeActiveLines(textField, color: linesColor, hide: true)
            }
            
            return true
        }
        
        private func updateLoginButtonState(_ textField: UITextField) {
            let emailIsEmpty = emailTextField.text?.isEmpty ?? true
            let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
            if emailIsEmpty || passwordIsEmpty {
                loginButton.isEnabled = false
                loginButton.backgroundColor = linesColor
            } else {
                loginButton.isEnabled = true
                loginButton.backgroundColor = .systemOrange
                loginButton.setTitleColor(UIColor.white, for: .normal)
            }
            
        }
    }
