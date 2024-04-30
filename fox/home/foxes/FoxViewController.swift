//
//  FoxViewController.swift
//  fox
//
//  Created by Gracie on 29/04/2024.
//

import UIKit

//protocol FoxViewControllerDelegate: AnyObject {
//    func createFox()
//}

class FoxViewController: UIViewController {
    
//    weak var delegate: FoxViewControllerDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        return tableView
    }()
    
    lazy var placeHolder: UILabel = {
        let tv = UILabel()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isHidden = false
        tv.textAlignment = .center
        tv.textColor = .gray
        tv.numberOfLines = 0
        tv.text = "No foxes yet!\n\nPlease click on the + button to add a fox"
        return tv
    }()
    
    lazy var floatingButton: UIButton = {
        let floater = UIButton(type: .custom)
        floater.translatesAutoresizingMaskIntoConstraints = false
        floater.setImage(UIImage(systemName: "plus.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal), for: .normal)
                         
        floater.addTarget(self, action: #selector(floatingTapped), for: .touchUpInside)
        return floater
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("trying to print fox data... ")
        print("Number of foxes to display: \(foxArray.count)")
        
        setLayout()
        updateViewVisibility()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("trying to print fox data after adding a fox... ")
        foxArray.forEach {fox in
            print(fox.breed)
        }
        updateViewVisibility()
    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
}
extension FoxViewController {
    private func updateViewVisibility() {
        if foxArray.isEmpty {
            tableView.isHidden = true
            placeHolder.isHidden = false
        } else {
            tableView.isHidden = false
            placeHolder.isHidden = true
        }
    }
}
    
extension FoxViewController{
    private func setLayout() {
        tableView.delegate = self
        tableView.dataSource = self
                
        view.addSubview(tableView)
        view.addSubview(placeHolder)
        view.addSubview(floatingButton)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),  
            
            placeHolder.topAnchor.constraint(equalTo: view.topAnchor),
            placeHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placeHolder.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            floatingButton.heightAnchor.constraint(equalToConstant: 50),
            floatingButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension FoxViewController{
    @objc func floatingTapped() {
        let addEditViewController = AddEditFoxViewController()
        navigationController?.pushViewController(addEditViewController, animated: true)
//        delegate?.createFox()
    }
}


extension FoxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foxArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("this one.. ")
        placeHolder.isHidden = true
        tableView.isHidden = false
        let cell = UITableViewCell()
        cell.textLabel?.text = foxArray[indexPath.row].breed
        return cell
    }
}
