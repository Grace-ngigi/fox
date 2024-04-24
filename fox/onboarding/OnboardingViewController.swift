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
    
    lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
//        stackview.spacing  = 0
//        stackview.alignment = .center
        return stackview
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
//        image.layer.borderWidth = 2.0
//        image.layer.borderColor = UIColor.red.cgColor
        image.image = UIImage(named: heroImage)
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
    }
}

extension OnboardingViewController {
    func layout() {
        stackview.addArrangedSubview(image)
        stackview.addArrangedSubview(label)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            
            image.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
