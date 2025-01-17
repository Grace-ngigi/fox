//
//  LoginView.swift
//  fox
//
//  Created by Gracie on 05/04/2024.
//

import Foundation
import UIKit

class LoginView: UIView {
    let usernameTF = UITextField()
    let passwordTF = UITextField()
    let stackview = UIStackView()
    let diivider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 8
        
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.placeholder = "Username"
        usernameTF.delegate = self
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.placeholder = "Password"
        passwordTF.delegate = self
        passwordTF.isSecureTextEntry = true
        
        diivider.translatesAutoresizingMaskIntoConstraints = false
        diivider.backgroundColor = .black
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    func layout() {
        stackview.addArrangedSubview(usernameTF)
        stackview.addArrangedSubview(diivider)
        stackview.addArrangedSubview(passwordTF)
        
        addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1),
            
            diivider.heightAnchor.constraint(equalToConstant: 1)
            
        ])
        
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTF.endEditing(true)
        passwordTF.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
