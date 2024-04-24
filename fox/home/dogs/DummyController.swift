//
//  DummyController.swift
//  fox
//
//  Created by Gracie on 22/04/2024.
//

import UIKit

class DummyController: UIViewController {
    var dog: [DogModel] = []
    var dogViewModel: [DogViewModel] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchDummyDogData()
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
extension DummyController {
    func fetchDummyData(completion: @escaping (Result<[DogModel], NetworkError>) -> Void) {
        let url = "https://api.thedogapi.com/v1/breeds"
                
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
                        let result: [DogModel] = try JSONDecoder().decode([DogModel].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(.decodingError))
                    }
            }.resume()
        }
}

// MARK: load data
extension DummyController {
    private func fetchDummyDogData() {
        self.fetchDummyData() { result in
            switch result {
            case .success(let dogData):
                self.dog = dogData
                DispatchQueue.main.async {
                    self.configureDogData(with: dogData)
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func configureDogData(with breeds: [DogModel]) {
        dogViewModel = breeds.map {breed in
            DogViewModel(name: breed.name,
                         description: breed.description,
                         weight: breed.weight.metric,
                         height: breed.height.metric,
                         lifespan: breed.lifeSpan)
        }
    }

}

extension DummyController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dogViewModel[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
