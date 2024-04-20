//
//  DogDetailViewController.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit
class DogDetailViewController: UIViewController {
    lazy var parentStackView: UIStackView = {
        let parentStackView = UIStackView()
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.backgroundColor = .clear
        return parentStackView
    }()
    
    lazy var detailsLabel: UILabel = {
        let detailsLabel = UILabel()
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.numberOfLines = 0

        return detailsLabel
    }()
    
    lazy var funfactLabel: UILabel = {
        let funfactLabel = UILabel()
        funfactLabel.translatesAutoresizingMaskIntoConstraints = false

        return funfactLabel
    }()
    
    lazy var firstImageView: UIImageView = {
        let firstImageView = UIImageView()
        firstImageView.translatesAutoresizingMaskIntoConstraints = false

        return firstImageView
    }()
    
    lazy var secondImageView: UIImageView = {
        let secondImageView = UIImageView()
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        return secondImageView
    }()

    lazy var thirdImageView: UIImageView = {
        let thirdImageView = UIImageView()
        thirdImageView.translatesAutoresizingMaskIntoConstraints = false
        return thirdImageView
    }()
}
