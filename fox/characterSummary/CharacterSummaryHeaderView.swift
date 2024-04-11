//
//  CharacterSummaryHeaderViiew.swift
//  fox
//
//  Created by Gracie on 11/04/2024.
//

import UIKit

class CharacterSummaryHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
           commonInit()
       }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: CharacterSummaryHeaderView.self)
        bundle.loadNibNamed("CharacterSummaryHeaderView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.backgroundColor = appColoor
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
}
