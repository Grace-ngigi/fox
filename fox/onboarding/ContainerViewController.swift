//
//  ContainerViewController.swift
//  fox
//
//  Created by Gracie on 08/04/2024.
//

import Foundation
import UIKit

protocol ContainerViewControllerDelegate: AnyObject {
   func didFinishOnboarding()
}

class ContainerViewController : UIViewController {
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
//    var currentVC: UIViewController {
//        didSet {
//            guard let index = pages.firstIndex(of: currentVC) else { return }
//            nextButton.isHidden = index == pages.count - 1
//            backButton.isHidden = index == 0
//            doneButton.isHidden = !(index == pages.count - 1)
//        }
//    }
    
    var currentVC: UIViewController {
        didSet {
            guard let index = pages.firstIndex(of: currentVC) else { return }
            
            switch index {
            case 0:
                // Show only the Next button if the index is 0
                nextButton.isHidden = false
                backButton.isHidden = true
                doneButton.isHidden = true
            case pages.count - 1:
                // Show only the Back button if the index is the last index
                nextButton.isHidden = true
                backButton.isHidden = false
                doneButton.isHidden = false
            default:
                // Show both Next and Back buttons for other indices
                nextButton.isHidden = false
                backButton.isHidden = true
                doneButton.isHidden = true
            }
        }
    }

    
    let closeButton = UIButton(type: .system)
    let doneButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    
    weak var delegate: ContainerViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                       navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(heroImage: "dog", labelText: "Dogs have a remarkable sense of smell, with some estimates suggesting they can detect scents up to 100,000 times better than humans.")
        let page2 = OnboardingViewController(heroImage: "cat", labelText: "Cats have a remarkable ability to rotate their ears independently, allowing them to precisely pinpoint the source of a sound. Each of their ears has 32 muscles, compared to a human's 6, which gives them exceptional control and range of motion.")
        let page3 = OnboardingViewController(heroImage: "foxxy5", labelText: "Foxes have a striking appearance characterized by their bushy tails, pointed ears, slender bodies, and often colorful fur")
        
        pages.append(page2)
        pages.append(page1)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        view.addSubview(closeButton)
        view.addSubview(doneButton)
        view.addSubview(nextButton)
        view.addSubview(backButton)

        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)        
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: [])
        doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)      
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.isHidden = true
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: [])
        backButton.isHidden = true
        backButton.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
        
        //        image.image =  UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32))

        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),            
            
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            
            nextButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 3),
            
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 3),

        ])
        
        pageViewController.setViewControllers([pages.first!],
                                              direction: .forward,
                                              animated: false,
                                              completion: nil)
        currentVC = pages.first!
    }
}

extension ContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 >= 0 else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}

//MARK: - Actions
extension ContainerViewController {
    
    @objc func nextTapped(_ sender: UIButton) {
        guard let nextVC = getNextViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func backTapped(_ sender: UIButton) {
        guard let previousVC = getPreviousViewController(from: currentVC) else { return }
        pageViewController.setViewControllers([previousVC], direction: .reverse, animated: true, completion: nil)
    }
    
    @objc func closeTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }
    
    @objc func doneTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }
}

