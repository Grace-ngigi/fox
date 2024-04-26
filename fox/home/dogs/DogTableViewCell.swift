//
//  DogTableViewCell.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit

protocol DogTableCellDelegate: AnyObject {
    func didSelectCell(withDogData data: DogViewModel)
}

class DogTableViewCell: UITableViewCell {
    static let cellId = "DogTableViewCell"
    weak var delegate: DogTableCellDelegate?
    //MARK - Declarations
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with dogViewModel: DogViewModel){
            delegate?.didSelectCell(withDogData: dogViewModel)
    }
}
