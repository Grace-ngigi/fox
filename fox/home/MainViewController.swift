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
        let dogVC = DogViewController()
        let catVC = CatViewController()
        let foxVC = FoxViewController()
        
        
        dogVC.setTabBarImage(imageName: "dog.fill", title: "Dog")
        catVC.setTabBarImage(imageName: "cat.fill", title: "Cat")
        foxVC.setTabBarImage(imageName: "note.text.badge.plus", title: "Fox")
        
        let dogNC = UINavigationController(rootViewController: dogVC)
        let catNC = UINavigationController(rootViewController: catVC)
        let foxNC = UINavigationController(rootViewController: foxVC)
        
        dogNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(dogNC.navigationBar)
        
        let tabBarList = [catNC, dogNC, foxNC]
        
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
