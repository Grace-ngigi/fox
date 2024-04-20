//
//  DogTableViewCell.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    static let cellId = "DogTableViewCell"
    //MARK - Declarations
    lazy var parentStackView: UIStackView = {
        let parentStackView = UIStackView()
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.axis = .horizontal
        parentStackView.backgroundColor = .clear
        parentStackView.spacing = 16
        return parentStackView
    }()
    
    lazy var breedLabel: UILabel = {
        let breedLabel = UILabel()
        breedLabel.translatesAutoresizingMaskIntoConstraints = false
        breedLabel.textAlignment = .left
        return breedLabel
    }()

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setViews()
    }

}

//MARK - Layouts
extension DogTableViewCell {
    private func setViews() {
        addSubview(parentStackView)
//        parentStackView.addArrangedSubview(image)
        parentStackView.addArrangedSubview(breedLabel)
        
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with dog: DogViewModel){
        breedLabel.text = dog.breed
    }
}
