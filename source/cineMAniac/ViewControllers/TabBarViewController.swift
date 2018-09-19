//
//  TabBarViewController.swift
//  cineMAniac
//
//  Created by Glny Gl on 14.09.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var tabItem1 = UITabBarItem()
    var tabItem2 = UITabBarItem()
    var tabItem3 = UITabBarItem()
    var tabItem4 = UITabBarItem()
    
    
    let topIMG = UIImage(named: "top")
    let searchIMG = UIImage(named: "search")
    let categoryIMG = UIImage(named: "category")
    let favoriteIMG = UIImage(named: "favorite")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabItem1 = self.tabBar.items![0]
        tabItem2 = self.tabBar.items![1]
        tabItem3 = self.tabBar.items![2]
        tabItem4 = self.tabBar.items![3]
        
        tabItem1.title = "Popular"
        tabItem2.title = "Search"
        tabItem3.title = "Categories"
        tabItem4.title = "Favorites"
        
        tabItem1.image = topIMG
        tabItem2.image = searchIMG
        tabItem3.image = categoryIMG
        tabItem4.image = favoriteIMG
        
    }

}
