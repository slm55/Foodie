//
//  FavouritesViewController.swift
//  Foody
//
//  Created by Aslan Murat on 27.01.2022.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favItems: [CartItem] = [
        CartItem(item:Item(name:"Pepperoni", price: 2690, preparationTime: 30, rating: 4.5), number: 1),
        CartItem(item:Item(name: "Fresh Salad", price: 2390, preparationTime: 30, rating: 5.0),  number: 1)
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavTableViewCell.self, forCellReuseIdentifier: FavTableViewCell.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "\(favItems.count) favourite items"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: (tabBarController?.tabBar.frame.maxY ?? 0) - view.safeAreaInsets.top - (tabBarController?.tabBar.frame.height ?? 0))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavTableViewCell.identifier, for: indexPath) as! FavTableViewCell
        cell.configure(with: favItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ItemViewController(item: favItems[indexPath.row].item)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: false)
    }

}
