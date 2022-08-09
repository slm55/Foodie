//
//  MenuViewController.swift
//  Foody
//
//  Created by Aslan Murat on 27.01.2022.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var selected: Int = 0 {
        willSet{
            self.categoryChanged(from: selected, to: newValue)
        }
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.isHighlighted = true
        return label
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "boyWithMask"), for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private let headerView: UIView = {
        let uiView = UIView()
        return uiView
    }()
    
    private let searchField: UISearchTextField = {
        let field = UISearchTextField()
        field.layer.cornerRadius = 20
        field.clipsToBounds = true
        field.placeholder = "Search"
        field.backgroundColor = UIColor(displayP3Red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        return field
    }()
    
    private let categoriesListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var categories: [String] = ["All", "Burgers", "Dishes", "Sushi", "All", "Burgers", "Dishes", "Sushi"]
    
    private var items: [Item] = [
        Item(name:"Pepperoni", price: 2690, preparationTime: 30, rating: 4.5),
        Item(name: "Fresh Salad", price: 2390, preparationTime: 30, rating: 5.0),
        Item(name:"Burger", price: 1890, preparationTime: 30, rating: 4.5),
        Item(name: "Sushi", price: 1990, preparationTime: 30, rating: 5.0),
        Item(name:"Pepperoni", price: 2690, preparationTime: 30, rating: 4.5),
        Item(name: "Fresh Salad", price: 2390, preparationTime: 30, rating: 5.0),
        Item(name:"Pepperoni", price: 2690, preparationTime: 30, rating: 4.5),
        Item(name: "Fresh Salad", price: 2390, preparationTime: 30, rating: 5.0)
    ]
    
    private let itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.addSubview(headerView)
        headerView.addSubview(menuLabel)
        headerView.addSubview(profileButton)
        scrollView.addSubview(searchField)
        scrollView.addSubview(categoriesListCollectionView)
        categoriesListCollectionView.dataSource = self
        categoriesListCollectionView.delegate = self
        scrollView.addSubview(itemsCollectionView)
        itemsCollectionView.dataSource = self
        itemsCollectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        headerView.frame = CGRect(x: 25, y: 0, width: view.frame.width - 50, height: 50)
        menuLabel.frame = CGRect(x: 0, y: 0, width: headerView.frame.width/2, height: 50)
        profileButton.frame = CGRect(x: headerView.frame.width - 40, y: 5, width: 40, height: 40)
        searchField.frame = CGRect(x: 30, y: headerView.frame.maxY + 20, width: view.frame.width - 60, height: 50)
        categoriesListCollectionView.frame = CGRect(x: 30, y: searchField.frame.maxY + 15, width: view.frame.width - 60, height: ((view.frame.width - 60)/4)*1.25 + 10)
        itemsCollectionView.frame = CGRect(x: 30, y: categoriesListCollectionView.frame.maxY + 15, width: view.frame.width - 60, height: CGFloat(items.count/2+20)*200)
        let height = itemsCollectionView.frame.minY - headerView.frame.minY + CGFloat( itemsCollectionView.collectionViewLayout.collectionViewContentSize.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: height+20)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesListCollectionView {
            return categories.count
        } else {
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesListCollectionView {
            guard let cell = categoriesListCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                fatalError()
            }
            if indexPath.row == selected {
                cell.button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
            }
            cell.configure(with: categories[indexPath.row])
            return cell
        } else {
            guard let cell = itemsCollectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: items[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesListCollectionView {
            return CGSize(width: (view.frame.width - 60)/4 - 22.5, height: ((view.frame.width - 60)/4 - 22.5)*1.25)
        } else {
            return CGSize(width: (view.frame.width - 60)/2 - 10, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoriesListCollectionView {
            return 30
        } else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    private func categoryChanged(from: Int, to: Int) {
        guard let fromCell = categoriesListCollectionView.cellForItem(at: IndexPath(row: from, section: 0)) as? CategoryCollectionViewCell else {
            fatalError()
        }
        fromCell.button.backgroundColor = UIColor(displayP3Red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        guard let toCell = categoriesListCollectionView.cellForItem(at: IndexPath(row: to, section: 0)) as? CategoryCollectionViewCell else {
            fatalError()
        }
        toCell.button.backgroundColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if collectionView == categoriesListCollectionView {
            selected = indexPath.row
        } else {
            let vc = ItemViewController(item: items[indexPath.row])
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}
