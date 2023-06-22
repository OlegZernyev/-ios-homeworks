//
//  LogInViewController.swift
//  Navigaton
//
//  Created by OlegZernyev on 23.05.2023.
//


import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Properties
        
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()    //
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = "LOGIN"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.tintColor = UIColor(named: "colorBlue")
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    private let  seporator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()    //
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = "PASSWORD"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6 //
        textField.isSecureTextEntry = true
        textField.tintColor = UIColor(named: "colorBlue")
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    private let stackText: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    
    
    private lazy var  loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = UIColor(named: "ColorBlue")
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushLogin), for: .touchUpInside)
        switch button.state {
        case .normal      : button.alpha = 1
        case .selected    : button.alpha = 0.8
        default: button.alpha = 1
        }
        return button
    }()
    
    private let notificationCenter = NotificationCenter.default
    
//    messageAuth
    
    private lazy var errorMassage: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: label.font.pointSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
//    authLogin
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == loginTextField {
            if let text = loginTextField.text, let _ = Range(range, in: text) {
                loginTextField.backgroundColor = .systemGray6
            }
        }
        if textField == passwordTextField {
            if let text = passwordTextField.text, let _ = Range(range, in: text) {
                passwordTextField.backgroundColor = .systemGray6
                if text.count > 4 {
                    errorMassage.text = ""
                }
            }
        }
        return true
    }
    
    
    @objc private func pushLogin() {
        
        guard let loginText  = loginTextField.text else {
            return
        }
        guard let passwordText  = passwordTextField.text else {
            return
        }
        
        var loginAlert = false
            if loginText == "admin" && passwordText == "password" {
                 loginAlert = false
                navigationController?.pushViewController(ProfileViewController(), animated: true)
            } else {
                 loginAlert = true
                if loginText.count == 0 {
                    loginTextField.backgroundColor = UIColor(red: 240, green: 0, blue: 0, alpha: 0.3)
                     loginAlert = false
                }
                
                if passwordText.count == 0 {
                    passwordTextField.backgroundColor = UIColor(red: 240, green: 0, blue: 0, alpha: 0.3)
                    loginAlert = false
                } else if passwordText.count < 6 {
                    errorMassage.text = "ПАРОЛЬ МЕНЕЕ 5 СИМВОЛОВ"
                    loginAlert = false
                }
            }
        
        if loginAlert {
            let alert = UIAlertController(title: "ОШИБКА", message: "ОШИБКА АВТОРИЗАЦИИ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default) {_ in
            }
            alert.addAction(okAction)
            present(alert, animated: true)
            passwordTextField.text = ""
        }
    }
    
    private func layout() {
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackText)
        stackText.addArrangedSubview(loginTextField)
        stackText.addArrangedSubview(seporator)
        stackText.addArrangedSubview(passwordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(errorMassage)

        let safeArea = view.safeAreaLayoutGuide
        let widthInset = view.frame.width - 32
        
        
        NSLayoutConstraint.activate([
            
            errorMassage.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            errorMassage.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 10),
            errorMassage.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor,constant: -10),
            errorMassage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
           
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
           
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
           
            passwordTextField.topAnchor.constraint(equalTo: seporator.bottomAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
          
            seporator.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
            seporator.heightAnchor.constraint(equalToConstant: 1),
            seporator.widthAnchor.constraint(equalToConstant:  widthInset),
            
            stackText.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            loginButton.topAnchor.constraint(equalTo: stackText.bottomAnchor, constant: 35),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant:  widthInset),
//            loginButtчкon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    //MARK: - Action
    

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + loginButton.frame.height + 16
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyboardSize.height + loginButton.frame.height + 16,
                                                                    right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
