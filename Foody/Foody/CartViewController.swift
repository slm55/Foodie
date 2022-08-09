//
//  CartViewController.swift
//  Foody
//
//  Created by Aslan Murat on 27.01.2022.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var itemsInCart: [CartItem] = [
        CartItem(item:Item(name:"Sushi", price: 1990, preparationTime: 30, rating: 4.5), number: 1),
        CartItem(item:Item(name: "Burger", price: 1890, preparationTime: 30, rating: 5.0),  number: 1)
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        return tableView
    }()
    
    private let totalButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        button.tintColor = .white
        button.setTitle("Total", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "\(itemsInCart.count) forward at cart"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(totalButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.top - 120)
        totalButton.frame = CGRect(x: 25, y: (tabBarController?.tabBar.frame.minY ?? 1000) - 105 , width: view.frame.width - 50, height: 75)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.configure(with: itemsInCart[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
