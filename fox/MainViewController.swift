//
//  MainViewController.swift
//  fox
//
//  Created by Gracie on 10/04/2024.
//

import UIKit

class MainViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpTabBar()
    }
    
    private func setUpViews() {
        let dogVC = DummyController()
        let catVC = CatViewController()
        let historyVC = HistoryViewController()
        
        
        dogVC.setTabBarImage(imageName: "dog.fill", title: "Dog")
        catVC.setTabBarImage(imageName: "cat.fill", title: "Cat")
        historyVC.setTabBarImage(imageName: "note.text.badge.plus", title: "Fox")
        
        let dogNC = UINavigationController(rootViewController: dogVC)
        let catNC = UINavigationController(rootViewController: catVC)
        let historyNC = UINavigationController(rootViewController: historyVC)
        
        dogNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(dogNC.navigationBar)
        
        let tabBarList = [dogNC, catNC, historyNC]
        
        viewControllers = tabBarList
    }
    
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setUpTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
        
    }
}

class HistoryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
