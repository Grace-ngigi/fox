//
//  DogDetailViewController.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit
class DogDetailViewController: UIViewController {
    let dogViewModel: DogViewModel
    
    init(dogViewModel: DogViewModel) {
        self.dogViewModel = dogViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var parentStackView: UIStackView = {
        let parentStackView = UIStackView()
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .vertical
        parentStackView.spacing = 4
        parentStackView.backgroundColor = .clear
        return parentStackView
    }() 
    
    lazy var attrStackView: UIStackView = {
        let attrStackView = UIStackView()
        attrStackView.translatesAutoresizingMaskIntoConstraints = false
        attrStackView.axis = .horizontal
        attrStackView.distribution = .fillEqually
        attrStackView.backgroundColor = .clear
        return attrStackView
    }()
    
    lazy var weightStackView: UIStackView = {
        let weightStackView = UIStackView()
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.axis = .vertical
        weightStackView.backgroundColor = .clear
        return weightStackView
    }()  
    
    lazy var lifespanStackView: UIStackView = {
        let lifespanStackView = UIStackView()
        lifespanStackView.translatesAutoresizingMaskIntoConstraints = false
        lifespanStackView.axis = .vertical
        lifespanStackView.backgroundColor = .clear
        return lifespanStackView
    }()

    lazy var originStackView: UIStackView = {
        let originStackView = UIStackView()
        originStackView.translatesAutoresizingMaskIntoConstraints = false
        originStackView.axis = .vertical
        originStackView.backgroundColor = .clear
        return originStackView
    }()
    
    
    lazy var detailsLabel: UILabel = {
        let detailsLabel = UILabel()
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.numberOfLines = 0

        return detailsLabel
    }() 
    
    lazy var weightLabel: UILabel = {
        let weightLabel = UILabel()
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        return weightLabel
    }()

    lazy var lifespanLabel: UILabel = {
        let lifespanLabel = UILabel()
        lifespanLabel.translatesAutoresizingMaskIntoConstraints = false
        return lifespanLabel
    }()
    
    lazy var originLabel: UILabel = {
        let originLabel = UILabel()
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        return originLabel
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
//        loadData()
    }
}

//MARK: Layout
extension DogDetailViewController {
    private func setUpView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        weightStackView.addArrangedSubview(weightLabel)
        lifespanStackView.addArrangedSubview(lifespanLabel)
        originStackView.addArrangedSubview(originLabel)
        attrStackView.addArrangedSubview(weightStackView)
        attrStackView.addArrangedSubview(lifespanStackView)
        attrStackView.addArrangedSubview(originStackView)
        parentStackView.addArrangedSubview(firstImageView)
        parentStackView.addArrangedSubview(detailsLabel)
        parentStackView.addArrangedSubview(attrStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
        ])
    }
}

//MARK: Load Data
extension DogDetailViewController {
    private func loadData(){
        
    }
}
