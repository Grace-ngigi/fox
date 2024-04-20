//
//  DogViewController.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit
class DogViewController: UIViewController {
    var dog: Dog?
    var dogList: [Dog] = []
    var dogViewModel: [DogViewModel] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.register(DogTableViewCell.self, forCellReuseIdentifier: DogTableViewCell.cellId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        fetchDogData()
    }
}


// MARK - layout
extension DogViewController {
    private func setViews() {
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: 2)
        ])
    }
}

//MARK - Network Calls
extension DogViewController {
    func fetchData(completion: @escaping (Result<Dog, NetworkError>) -> Void) {
        let url = "https://dog.ceo/api/breeds/list/all"
                
            guard let url = URL(string: url) else {
                completion(.failure(.invalidURL))
                return
            }
            URLSession.shared.dataTask(with: url){ data, response, error in
                DispatchQueue.main.sync {
                    guard let data = data, error == nil else {
                        completion(.failure(.serverError))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        var result: Dog = try decoder.decode(Dog.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(.decodingError))
                    }

                }
            }.resume()
        }
}

// MARK - load data
extension DogViewController {
    func fetchDogData() {
        DispatchQueue.main.async {
            self.fetchData() { result in
                switch result {
                case .success(let dogData):
                    self.dog = dogData
                    guard let dog = self.dog else {
                        return
                    }
                    let breedNames = Array(dog.message.keys)
                    self.configureDogData(with: breedNames)
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func configureDogData(with breeds: [String]){
        dogViewModel = breeds.map {
            DogViewModel(breed: $0)
        }
    }
}

// MARK - Datasource
extension DogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.cellId, for: indexPath) as! DogTableViewCell
        
        let dogs = dogViewModel[indexPath.row]
        cell.textLabel?.text = dogs.breed
//        cell.configure(with: dogs)
        return cell
    }
}
