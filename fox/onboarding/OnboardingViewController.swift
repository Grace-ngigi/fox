//
//  OnboardingViewController.swift
//  fox
//
//  Created by Gracie on 08/04/2024.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    var heroImage: String
    var labelText: String
    
    init(heroImage: String, labelText: String) {
        self.heroImage = heroImage
        self.labelText = labelText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackview = UIStackView()
    let label = UILabel()
    let image = UIImageView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style() {
        
        view.backgroundColor = .systemBackground
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing  = 20
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        if let originalImage = UIImage(named: heroImage) {
//            let targetSize = CGSize(width: 50, height: 50) // Specify your target size here
//            let resizedImage = resizeImage(image: originalImage, targetSize: targetSize)
            
            // Use resizedImage as needed
//            image.image = resizedImage
//        }

//        image.image = UIImage(named: heroImage)
        
    }
    
    func layout() {
        stackview.addArrangedSubview(image)
        stackview.addArrangedSubview(label)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1),
        ])
    }
}
