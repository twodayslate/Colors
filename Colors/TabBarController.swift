//
//  SRCTabBarController.swift
//  ec3730
//
//  Created by Zachary Gorak on 8/23/18.
//  Copyright © 2018 Zachary Gorak. All rights reserved.
//

import Foundation
import UIKit

class TabBarController : UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        defaultsChanged()
        
        self.moreNavigationController.tabBarItem = UITabBarItem(title: "More", image:UIImage(named: "more"), tag: 0)
        self.moreNavigationController.tabBarItem.selectedImage = UIImage(named: "more_selected")
        
        let colors = FirstViewController()
        
        var items = [colors]
        var final_items : [UIViewController] = []
        
        // we are going to sort the items based on the saved tag state
        if let sorted_item_tags = UserDefaults.standard.object(forKey: "tab_bar_items") as? [Int] {
            for desired_item_tag in sorted_item_tags {
                for (index, real_item) in items.enumerated() {
                    if desired_item_tag == real_item.tabBarItem.tag {
                        final_items.append(real_item)
                        items.remove(at: index)
                    }
                }
            }
            
            for item in items {
                final_items.append(item)
            }
            items.removeAll()
        } else {
            final_items = items
        }
        
        self.viewControllers = final_items
    }
    
    override func tabBar(_ tabBar: UITabBar,
                willEndCustomizing items: [UITabBarItem],
                changed: Bool) {
        super.tabBar(tabBar, willEndCustomizing: items, changed: changed)
        var item_rar : [Int] = []
        for item in items {
            if item.tag != 0 {
                item_rar.append(item.tag)
            }
        }
        
        UserDefaults.standard.set(item_rar, forKey: "tab_bar_items")
        UserDefaults.standard.synchronize()
    }
    
    @objc func defaultsChanged() {
        if #available(iOS 13.0, *) {
            DispatchQueue.main.async {
                switch UserDefaults.standard.integer(forKey: "theme") {
                case 1:
                    self.overrideUserInterfaceStyle = .light
                case 2:
                    self.overrideUserInterfaceStyle = .dark
                default:
                    self.overrideUserInterfaceStyle = .unspecified
                }
            }
        }
    }
}
