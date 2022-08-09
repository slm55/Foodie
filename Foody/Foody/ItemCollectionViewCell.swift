//
//  ItemCollectionViewCell.swift
//  Foody
//
//  Created by Aslan Murat on 29.01.2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    private let mainView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(displayP3Red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        uiView.clipsToBounds = true
        uiView.layer.cornerRadius = 20
        return uiView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 255/255.0, green: 184/255.0, blue: 0/255.0, alpha: 1.0)
        label.font = .preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.layer.cornerRadius = 12.5
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainView)
        mainView.addSubview(imageView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(priceLabel)
        addSubview(addButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        mainView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - 10)
        imageView.frame = CGRect(x: contentView.frame.width*0.2, y: 15, width: contentView.frame.width*0.6, height: contentView.frame.width*0.6)
        nameLabel.frame = CGRect(x: contentView.frame.width*0.2, y: imageView.frame.maxY + 15, width: contentView.frame.width*0.6, height: 15)
        priceLabel.frame = CGRect(x: contentView.frame.width*0.2, y: nameLabel.frame.maxY + 10, width: contentView.frame.width*0.6, height: 15)
        addButton.frame = CGRect(x: contentView.frame.width/2-10, y: mainView.frame.height-10, width: 25, height: 25)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: Item){
        imageView.image = UIImage(named: item.name)
        nameLabel.text = item.name
        priceLabel.text  = "₸" + String(item.price)
    }
}
