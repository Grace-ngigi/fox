//
//  HomeController.swift
//  fox
//
//  Created by Gracie on 09/04/2024.
//

import UIKit

protocol HomeControllerDelegate: AnyObject {
    func didLogout()
}

class HomeController: UIViewController {
    
    let labelText = UILabel()
    let logoutButton = UIButton()
    let stackview = UIStackView()
    
    weak var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {   
        super.viewDidLoad()
        style()
        layout()
    }
}

extension HomeController {
    private func style(){
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10
        stackview.axis = .vertical
        
        labelText.text = "Future Home Page"
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.textAlignment = .center
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: [])
        logoutButton.configuration = .bordered()
        logoutButton.configuration?.imagePadding = 8
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    private func layout(){
        stackview.addArrangedSubview(labelText)
        stackview.addArrangedSubview(logoutButton)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackview.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1),
//            view.bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1),
            
        ])
        
    }
}

extension HomeController {
    @objc func logoutTapped(_ sender: UIButton){
        delegate?.didLogout()
    }
}
