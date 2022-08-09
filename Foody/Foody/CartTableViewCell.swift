//
//  CartTableViewCell.swift
//  Foody
//
//  Created by Aslan Murat on 17.02.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    static let identifier = "CartTableViewCell"
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
    
    private let numberView: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 15
        uiView.layer.borderColor = UIColor.systemGray4.cgColor
        uiView.layer.borderWidth = 0.5
        return uiView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = .white
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.masksToBounds = false
        return button
    }()
    
    private let reduceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = .white
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.masksToBounds = false
        return button
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    override func layoutSubviews() {
        uiView.frame = CGRect(x: 40, y: 15, width: contentView.frame.width - 80, height: contentView.frame.height - 30)
        itemImageView.frame = CGRect(x: -20, y: 20, width: 90, height: 90)
        nameLabel.frame = CGRect(x: itemImageView.frame.maxX + 20, y: 15, width: uiView.frame.width - itemImageView.frame.maxX - 60, height: 40)
        priceLabel.frame = CGRect(x: itemImageView.frame.maxX + 20, y: nameLabel.frame.maxY + 20, width: uiView.frame.width - itemImageView.frame.maxX - 80, height: 40)
        numberView.frame = CGRect(x: priceLabel.frame.maxX + 10, y: 20, width: 30, height: 90)
        addButton.frame = CGRect(x: 1, y: 1, width: 28, height: 28)
        reduceButton.frame = CGRect(x: 1, y: 61, width: 28, height: 28)
        numberLabel.frame = CGRect(x: 0, y: addButton.frame.maxY, width: numberView.frame.width, height: reduceButton.frame.minY - addButton.frame.maxY)
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
        uiView.addSubview(numberView)
        numberView.addSubview(addButton)
        numberView.addSubview(reduceButton)
        numberView.addSubview(numberLabel)
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        reduceButton.addTarget(self, action: #selector(reduceTapped), for: .touchUpInside)
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
        numberLabel.text = "\(cartItem.number)"
        self.cartItem = cartItem
    }
    
    @objc private func addTapped(){
        if cartItem != nil {
            cartItem!.number = cartItem!.number  + 1
            configure(with: cartItem!)
        }
    }
    
    @objc private func reduceTapped(){
        if cartItem != nil {
            cartItem!.number = cartItem!.number - 1
            if cartItem!.number < 0 {
                cartItem!.number = 0
            }
            configure(with: cartItem!)
        }
    }
    
    @objc private func leftSwiped(recognizer: UISwipeGestureRecognizer) {
        print("swiped left")
    }
}
