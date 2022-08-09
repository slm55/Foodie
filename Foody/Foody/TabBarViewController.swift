//
//  TabBarViewController.swift
//  Foody
//
//  Created by Aslan Murat on 27.01.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()
    }
    
    private func setUpControllers() {
        let menuPage = MenuViewController()
        let mapPage = MapViewController()
        mapPage.title = "Map"
        let favsPage = FavouritesViewController()
        favsPage.title = "Favourites"
        let cartPage = CartViewController()
        
        let nav1 = UINavigationController(rootViewController: menuPage)
        let nav2 = UINavigationController(rootViewController: mapPage)
        let nav3 = UINavigationController(rootViewController: favsPage)
        let nav4 = UINavigationController(rootViewController: cartPage)
        
        
        nav2.navigationBar.prefersLargeTitles = false
        nav3.navigationBar.prefersLargeTitles = false
        nav4.navigationBar.prefersLargeTitles = false
        
        nav1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "menu"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "location"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "heart"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "cart"), tag: 4)
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(displayP3Red: 107/255.0, green: 69/255.0, blue: 188/255.0, alpha: 1.0)
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
}
