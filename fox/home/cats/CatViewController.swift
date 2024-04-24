//
//  CatViewController.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit

class CatViewController: UIViewController {
    var catModel: [CatModel] = []
    var catViewModel: [CatViewModel] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchCatData()
    }
    
    private func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: Network Calls
extension CatViewController {
    func fetchData(completion: @escaping (Result<[CatModel], NetworkError>) -> Void) {
        let url = "https://api.thecatapi.com/v1/breeds"
                
            guard let url = URL(string: url) else {
                completion(.failure(.invalidURL))
                return
            }
            URLSession.shared.dataTask(with: url){ data, response, error in
                    guard let data = data, error == nil else {
                        completion(.failure(.serverError))
                        return
                    }

                    do {
                        let result: [CatModel] = try JSONDecoder().decode([CatModel].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(.decodingError))
                    }
            }.resume()
        }
}

// MARK: load data
extension CatViewController {
    private func fetchCatData() {
        self.fetchData() { result in
            switch result {
            case .success(let catData):
                self.catModel = catData
                DispatchQueue.main.async {
                    self.configureCatData(with: catData)
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func configureCatData(with cats: [CatModel]) {
        catViewModel = cats.map {cat in
            CatViewModel(weight: cat.weight.metric,
                         id: cat.id,
                         name: cat.name,
                         temperament: cat.temperament,
                         origin: cat.origin,
                         description: cat.description,
                         lifeSpan: cat.lifeSpan,
                         adaptability: cat.adaptability,
                         affectionLevel: cat.affectionLevel,
                         childFriendly: cat.childFriendly,
                         dogFriendly: cat.dogFriendly,
                         hypoallergenic: cat.hypoallergenic)
        }
    }

}

extension CatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = catViewModel[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
