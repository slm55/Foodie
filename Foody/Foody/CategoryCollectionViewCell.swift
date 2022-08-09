//
//  CategoryCollectionViewCell.swift
//  Foody
//
//  Created by Aslan Murat on 28.01.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.backgroundColor = UIColor(displayP3Red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        return button
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.width)
        label.frame = CGRect(x: 0, y: button.frame.maxY + 10, width: contentView.frame.width, height: contentView.frame.width/4)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with category: String){
        button.setImage(UIImage(named: category), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: contentView.frame.width*0.2, left: contentView.frame.width*0.2, bottom: contentView.frame.width*0.2, right: contentView.frame.width*0.2)
        label.text = category
    }
}
