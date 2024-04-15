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
        let characterVC = CharacterViewController()
        let feedingVC = FeedingViewController()
        let historyVC = HistoryViewController()
        
        
        characterVC.setTabBarImage(imageName: "dog", title: "Character")
        feedingVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Feeding")
        historyVC.setTabBarImage(imageName: "book.pages", title: "History")
        
        let characterNC = UINavigationController(rootViewController: characterVC)
        let feedingNC = UINavigationController(rootViewController: feedingVC)
        let historyNC = UINavigationController(rootViewController: historyVC)
        
        characterNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(characterNC.navigationBar)
        
        let tabBarList = [characterNC, feedingNC, historyNC]
        
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

class FeedingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class HistoryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
