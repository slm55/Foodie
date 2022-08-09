//
//  ItemViewController.swift
//  Foody
//
//  Created by Aslan Murat on 30.01.2022.
//

import UIKit

class ItemViewController: UIViewController {
    var item: Item
    
    private let uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 30
        uiView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        uiView.clipsToBounds = true
        return uiView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let favButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")?.withTintColor(.white)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(displayP3Red: 255/255.0, green: 184/255.0, blue: 0/255.0, alpha: 1.0)
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    
    private let preparationTimeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        let timeIcon = UIImageView(image: UIImage(named: "prepareTime"))
        view.addSubview(timeIcon)
        timeIcon.frame = CGRect(x: 7.5, y: 7.5, width: 20, height: 20)
        return view
    }()
    
    private let ratingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        let starIcon = UIImageView(image: UIImage(named: "star"))
        view.addSubview(starIcon)
        starIcon.frame = CGRect(x: 5, y: 5, width: 25, height: 25)
        return view
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.text = "About"
        label.textAlignment = .natural
        return label
    }()
    
    private let aboutItemLabel: UITextView = {
        let field = UITextView()
        field.font = .preferredFont(forTextStyle: .body)
        field.textColor = .systemGray
        field.textAlignment = .left
        field.font = .preferredFont(forTextStyle: .body)
        field.isScrollEnabled = true
        field.isEditable = false
        field.showsVerticalScrollIndicator = false
        return field
    }()
    
    private let addItemButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        button.tintColor = .white
        button.setTitle("Add to cart", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        view.addSubview(backButton)
        view.addSubview(favButton)
        view.addSubview(uiView)
        view.addSubview(imageView)
        imageView.image = UIImage(named: item.name)
        uiView.addSubview(nameLabel)
        nameLabel.text = item.name
        uiView.addSubview(priceLabel)
        priceLabel.text = "₸" + String(item.price)
        uiView.addSubview(preparationTimeView)
        let timeLabel = UILabel(frame: CGRect(x: 35, y: 7.5, width: 40, height: 20))
        timeLabel.text = "\(item.preparationTime)m"
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        preparationTimeView.addSubview(timeLabel)
        if item.rating != nil {
            let ratingLabel = UILabel(frame: CGRect(x: 35, y: 7.5, width: 30, height: 20))
            ratingLabel.text = "\(item.rating!)"
            ratingLabel.textAlignment = .center
            ratingLabel.textColor = .white
            ratingView.addSubview(ratingLabel)
            uiView.addSubview(ratingView)
        }
        uiView.addSubview(aboutLabel)
        uiView.addSubview(aboutItemLabel)
        aboutItemLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        uiView.addSubview(addItemButton)
    }
    
    init(item:Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backButton.frame = CGRect(x: 25, y: view.safeAreaInsets.bottom + 50, width: 30, height: 30)
        favButton.frame = CGRect(x: view.frame.width - 55, y: view.safeAreaInsets.bottom + 50, width: 30, height: 30)
        uiView.frame = CGRect(x: 0, y: 0.35*view.frame.height, width: view.frame.width, height: 0.65*view.frame.height + (tabBarController?.tabBar.frame.height ?? 0))
        imageView.frame = CGRect(x: 0.2*view.frame.width, y: uiView.frame.minY - 0.3*view.frame.width, width: 0.6*view.frame.width, height: 0.6*view.frame.width)
        nameLabel.frame = CGRect(x: 25, y: imageView.frame.height / 2 + 50, width: (view.frame.width - 50)/2, height: 40)
        priceLabel.frame = CGRect(x: nameLabel.frame.maxY, y: nameLabel.frame.minY, width: (view.frame.width - 50)/2, height: 40)
        preparationTimeView.frame = CGRect(x: 25, y: nameLabel.frame.maxY + 30, width: 82.5, height: 35)
        ratingView.frame = CGRect(x: preparationTimeView.frame.maxX + 15, y: preparationTimeView.frame.minY, width: 75, height: 35)
        aboutLabel.frame = CGRect(x: 25, y: preparationTimeView.frame.maxY + 30, width: view.frame.width - 50, height: 30)
        aboutLabel.sizeToFit()
        addItemButton.frame = CGRect(x: 25, y: uiView.frame.height - 105, width: view.frame.width - 50, height: 75)
        aboutItemLabel.frame = CGRect(x: 25, y: aboutLabel.frame.maxY + 10 , width: view.frame.width - 50, height: addItemButton.frame.minY - aboutLabel.frame.maxY - 25)
    }
    
    @objc private func backButtonTapped() {
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func favButtonTapped() {
        favButton.setImage(UIImage(named: "filledHeart"), for: .normal)
    }
}
