//
//  LoginViewController.swift
//  fox
//
//  Created by Gracie on 05/04/2024.
//
import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    let foxTitle = UILabel()
    let moreText = UILabel()
    let loginView = LoginView()
    let logiinbutton = UIButton()
    let errorLabel = UILabel()
    let otherView = UIView()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username:String? {
        return loginView.usernameTF.text
    }    
    
    var password:String? {
        return loginView.passwordTF.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logiinbutton.configuration?.showsActivityIndicator = false

    }
}
    
    extension LoginViewController {
        private func style() {
            view.backgroundColor = .systemBackground
            
            foxTitle.translatesAutoresizingMaskIntoConstraints = false
            foxTitle.text = "The Red Fox"
            foxTitle.textAlignment = .center
            foxTitle.font = UIFont.preferredFont(forTextStyle: .title1)
            foxTitle.alpha = 0
            foxTitle.adjustsFontForContentSizeCategory = true
            foxTitle.textColor = .black

            moreText.translatesAutoresizingMaskIntoConstraints = false
            moreText.text = "This app provides details of some of the most incredible animals"
            moreText.numberOfLines = 0
            moreText.textAlignment = .center
            moreText.adjustsFontForContentSizeCategory = true
            foxTitle.alpha = 0
            moreText.textColor = .black
            
            
            loginView.translatesAutoresizingMaskIntoConstraints = false
            
            logiinbutton.translatesAutoresizingMaskIntoConstraints = false
            logiinbutton.configuration = .filled()
            logiinbutton.configuration?.imagePadding = 8
            logiinbutton.setTitle("Sign In", for: [])
            logiinbutton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
            
            
            errorLabel.translatesAutoresizingMaskIntoConstraints = false
            errorLabel.textAlignment = .center
            errorLabel.textColor = .systemRed
            errorLabel.text = "a big scaring error"
            errorLabel.isHidden = true
            
        }
        private func layout() {
            view.addSubview(foxTitle)
            view.addSubview(moreText)
            view.addSubview(loginView)
            view.addSubview(logiinbutton)
            view.addSubview(errorLabel)
                        
            NSLayoutConstraint.activate([
//                foxTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                foxTitle.topAnchor.constraint(equalTo: view.topAnchor),
                foxTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: foxTitle.trailingAnchor, multiplier: 1),

                              
                moreText.topAnchor.constraint(equalToSystemSpacingBelow: foxTitle.bottomAnchor, multiplier: 1),
                moreText.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: moreText.trailingAnchor, multiplier: 1),
                             
                loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loginView.topAnchor.constraint(equalToSystemSpacingBelow: moreText.bottomAnchor, multiplier: 3),
                loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
                
                logiinbutton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 3),
                logiinbutton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: logiinbutton.trailingAnchor, multiplier: 1),
                
                
                errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: logiinbutton.bottomAnchor, multiplier: 2),
                errorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorLabel.trailingAnchor, multiplier: 1)
            ])
        }
    }

// MARRK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Should not be empty or nil")
            return
        }
//        
        if username.isEmpty || password.isEmpty{
            configureView(withMsg: "Should not be empty or nil")
        }
        if username == "" && password == ""{
            logiinbutton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
//            errorLabel.textColor = .systemGreen
//            errorLabel.isHidden = false
//            errorLabel.text = "welcome Foxxy"
        } else {
            configureView(withMsg: "wrong credentials")
        }
    }
    
    private func configureView(withMsg message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
