//
//  CatTableViewCell.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit

protocol CatTableCellDelegate: AnyObject {
    func didSelectCell(withCatData data: CatViewModel)
}

class CatTableViewCell: UITableViewCell {
    
    weak var delegate: CatTableCellDelegate?
//    var catviewModel: CatViewModel?
    
    static let cellId = "catTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(with catViewModel: CatViewModel){
            delegate?.didSelectCell(withCatData: catViewModel)
    }

}
