//
//  FavTableViewCell.swift
//  Foody
//
//  Created by Aslan Murat on 20.03.2022.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    static let identifier = "FavTableViewCell"
    private var cartItem: CartItem? = nil
    
    private let uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(displayP3Red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        uiView.layer.cornerRadius = 20
        return uiView
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 45
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 7
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(displayP3Red: 255/255.0, green: 184/255.0, blue: 0/255.0, alpha: 1.0)
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 12.5
        button.setImage(UIImage(named: "delete"), for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        uiView.frame = CGRect(x: 40, y: 15, width: contentView.frame.width - 80, height: contentView.frame.height - 30)
        itemImageView.frame = CGRect(x: -20, y: 20, width: 90, height: 90)
        nameLabel.frame = CGRect(x: itemImageView.frame.maxX + 20, y: 15, width: uiView.frame.width - itemImageView.frame.maxX - 60, height: 40)
        priceLabel.frame = CGRect(x: itemImageView.frame.maxX + 20, y: nameLabel.frame.maxY + 20, width: uiView.frame.width - itemImageView.frame.maxX - 80, height: 40)
        deleteButton.frame = CGRect(x: uiView.frame.width - 35, y: 10, width: 25, height: 25)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(uiView)
        uiView.addSubview(itemImageView)
        uiView.addSubview(nameLabel)
        uiView.addSubview(priceLabel)
        uiView.addSubview(deleteButton)
        let leftGestureRecognizer = UISwipeGestureRecognizer(
            target: self, action: #selector(leftSwiped)
        )
        leftGestureRecognizer.direction = .left
        uiView.addGestureRecognizer(leftGestureRecognizer)
    }
    
    func configure(with cartItem: CartItem){
        itemImageView.image = UIImage(named: cartItem.item.name)
        nameLabel.text = cartItem.item.name
        priceLabel.text = "₸\(cartItem.item.price)"
        self.cartItem = cartItem
    }
    
    @objc private func leftSwiped(recognizer: UISwipeGestureRecognizer) {
        print("swiped left")
    }
}
