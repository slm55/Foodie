//
//  AuthUIView.swift
//  Foody
//
//  Created by Aslan Murat on 24.01.2022.
//

import UIKit

class AuthUIView: UIScrollView {
    private var selectedButton = "login"
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0), for: .normal)
        button.backgroundColor = .none
        button.layer.borderColor = .none
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.borderColor = .none
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    private let bottomLine: CALayer = {
        let borderBottom = CALayer()
        borderBottom.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0).cgColor
        return borderBottom
    }()
    
    private let emailPhoto: UIImageView = {
        let image = UIImage(systemName: "envelope")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email address"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter your email address"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        field.leftViewMode = .always
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        return field
    }()
    
    private let emailFieldBottomLine: UIView = {
        let borderBottom = UIView()
        borderBottom.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        return borderBottom
    }()
    
    private let passwordPhoto: UIView = {
        let image = UIImage(systemName: "key")
        var imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        return imageView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        field.leftViewMode = .always
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.isSecureTextEntry = true
        return field
    }()
    
    private let passwordFieldBottomLine: UIView = {
        let borderBottom = UIView()
        borderBottom.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        return borderBottom
    }()
    
    private let repeatPasswordPhoto: UIView = {
        let image = UIImage(systemName: "key")
        var imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        return imageView
    }()
    
    
    private let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()
    
    private let repeatPasswordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        field.leftViewMode = .always
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.isSecureTextEntry = true
        return field
    }()
    
    private let repeatPasswordFieldBottomLine: UIView = {
        let borderBottom = UIView()
        borderBottom.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        return borderBottom
    }()
    
    private let authButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let forgetPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forget password?"
        label.textColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    private let mainUiView: UIView = {
        let uiView = UIView()
        return uiView
    }()
    
    @objc private func didTapLogin(){
        if selectedButton != "login" {
            DispatchQueue.main.async {
                self.move(to: "login")
            }
        }
        loginButton.setTitleColor(UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0), for: .normal)
        signUpButton.setTitleColor(.systemGray, for: .normal)
        authButton.setTitle("Login", for: .normal)
        selectedButton = "login"
    }
    
    @objc private func didTapSignUp(){
        if selectedButton != "signup" {
            DispatchQueue.main.async {
                self.move(to: "signup")
            }
        }
        signUpButton.setTitleColor(UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0), for: .normal)
        loginButton.setTitleColor(.systemGray, for: .normal)
        authButton.setTitle("Sign up", for: .normal)
        selectedButton = "signup"
    }
    
    private func move(to button: String) {
        let animation = CABasicAnimation(keyPath: "position")
        emailField.text = ""
        passwordField.text = ""
        repeatPasswordField.text = ""
        if button == "login" {
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                [weak self] in
                self?.mainUiView.transform = CGAffineTransform(translationX: -(self?.mainUiView.frame.width ?? 0), y: 0.0)
            }, completion: nil)
            animation.fromValue = CGPoint(x: signUpButton.frame.midX, y: loginButton.frame.maxY)
            animation.toValue = CGPoint(x: loginButton.frame.midX, y: loginButton.frame.maxY)
            UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                [weak self] in
                self?.mainUiView.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                        }, completion: nil)
        }
        
        else {
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                [weak self] in
                self?.mainUiView.transform = CGAffineTransform(translationX: -(self?.mainUiView.frame.width ?? 0), y: 0.0)
            }, completion: nil)
            animation.fromValue = CGPoint(x: loginButton.frame.midX, y: loginButton.frame.maxY)
            animation.toValue = CGPoint(x: signUpButton.frame.midX, y: loginButton.frame.maxY)
        }
        
        animation.duration = 0.15
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        bottomLine.add(animation, forKey: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundColor = .white
        clipsToBounds = true
        addSubview(loginButton)
        layer.addSublayer(bottomLine)
        addSubview(signUpButton)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        addSubview(mainUiView)
        mainUiView.addSubview(emailPhoto)
        mainUiView.addSubview(emailLabel)
        mainUiView.addSubview(emailField)
        mainUiView.addSubview(emailFieldBottomLine)
        mainUiView.addSubview(passwordPhoto)
        mainUiView.addSubview(passwordLabel)
        mainUiView.addSubview(passwordField)
        mainUiView.addSubview(passwordFieldBottomLine)
        mainUiView.addSubview(repeatPasswordPhoto)
        mainUiView.addSubview(repeatPasswordLabel)
        mainUiView.addSubview(repeatPasswordField)
        mainUiView.addSubview(repeatPasswordFieldBottomLine)
        mainUiView.addSubview(forgetPasswordLabel)
        addSubview(authButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loginButton.frame = CGRect(x: frame.width*0.2, y: 20, width: frame.width*0.25, height: 40)
        signUpButton.frame = CGRect(x: frame.width*0.55, y: 20, width: frame.width*0.25, height: 40)
        bottomLine.frame = CGRect(x: loginButton.frame.minX+loginButton.frame.size.width*0.35, y: loginButton.frame.maxY, width: loginButton.frame.size.width*0.3, height: 2)
        mainUiView.frame = CGRect(x: 0, y: loginButton.frame.maxY, width: frame.width, height: authButton.frame.minY - loginButton.frame.maxY)
        updateLayout()
        authButton.frame = CGRect(x: 20, y: frame.height - 80, width: frame.size.width - 30, height: 50)
    }
    
    private func updateLayout(){
        if selectedButton == "login" {
            emailLabel.frame = CGRect(x: 20, y: (mainUiView.frame.height - 240)/2 , width: frame.size.width - 40, height: 40)
            emailPhoto.frame = CGRect(x: 20, y: emailLabel.frame.maxY + 20, width: 30, height: 20)
            emailField.frame = CGRect(x: 60, y: emailLabel.frame.maxY + 10, width: frame.size.width - 80, height: 40)
            emailFieldBottomLine.frame = CGRect(x: 20, y: emailField.frame.maxY, width: frame.width - 40, height: 2)
            passwordLabel.frame = CGRect(x: 20, y: emailFieldBottomLine.frame.maxY + 20, width: frame.size.width - 40, height: 40)
            passwordPhoto.frame = CGRect(x: 22.5, y: passwordLabel.frame.maxY + 15, width: 25, height: 30)
            passwordField.frame = CGRect(x: 60, y: passwordLabel.frame.maxY + 10, width: frame.size.width - 80, height: 40)
            passwordFieldBottomLine.frame = CGRect(x: 20, y: passwordField.frame.maxY, width: frame.width - 40, height: 2)
            forgetPasswordLabel.frame = CGRect(x: 20, y: passwordFieldBottomLine.frame.maxY + 10, width: frame.size.width - 40, height: 20)
            repeatPasswordPhoto.isHidden = true
            repeatPasswordField.isHidden = true
            repeatPasswordLabel.isHidden = true
            repeatPasswordFieldBottomLine.isHidden = true
            forgetPasswordLabel.isHidden = false
        }
        else {
            emailLabel.frame = CGRect(x: 20, y: (mainUiView.frame.height - 330)/2 , width: frame.size.width - 40, height: 40)
            emailPhoto.frame = CGRect(x: 20, y: emailLabel.frame.maxY + 20, width: 30, height: 20)
            emailField.frame = CGRect(x: 60, y: emailLabel.frame.maxY + 10, width: frame.size.width - 80, height: 40)
            emailFieldBottomLine.frame = CGRect(x: 20, y: emailField.frame.maxY, width: frame.width - 40, height: 2)
            passwordLabel.frame = CGRect(x: 20, y: emailFieldBottomLine.frame.maxY + 20, width: frame.size.width - 40, height: 40)
            passwordPhoto.frame = CGRect(x: 22.5, y: passwordLabel.frame.maxY + 15, width: 25, height: 30)
            passwordField.frame = CGRect(x: 60, y: passwordLabel.frame.maxY + 10, width: frame.size.width - 80, height: 40)
            passwordFieldBottomLine.frame = CGRect(x: 20, y: passwordField.frame.maxY, width: frame.width - 40, height: 2)
            repeatPasswordLabel.frame = CGRect(x: 20, y: passwordFieldBottomLine.frame.maxY + 20, width: frame.size.width - 40, height: 40)
            repeatPasswordPhoto.frame = CGRect(x: 22.5, y: repeatPasswordLabel.frame.maxY + 15, width: 25, height: 30)
            repeatPasswordField.frame = CGRect(x: 60, y: repeatPasswordLabel.frame.maxY + 10, width: frame.size.width - 80, height: 40)
            repeatPasswordFieldBottomLine.frame = CGRect(x: 20, y: repeatPasswordField.frame.maxY, width: frame.width - 40, height: 2)
            repeatPasswordPhoto.isHidden = false
            repeatPasswordField.isHidden = false
            repeatPasswordLabel.isHidden = false
            repeatPasswordFieldBottomLine.isHidden = false
            forgetPasswordLabel.isHidden = true
        }
    }
}
