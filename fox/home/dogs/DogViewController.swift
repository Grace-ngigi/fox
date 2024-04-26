//
//  DogViewController.swift
//  fox
//
//  Created by Gracie on 22/04/2024.
//

import UIKit

class DogViewController: UIViewController {
    var dog: [DogModel] = []
    var dogViewModel: [DogViewModel] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        tableView.register(DogTableViewCell.self, forCellReuseIdentifier: DogTableViewCell.cellId)

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchDogData()
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
extension DogViewController {
    func fetchData(completion: @escaping (Result<[DogModel], NetworkError>) -> Void) {
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
extension DogViewController {
    private func fetchDogData() {
        self.fetchData() { result in
            switch result {
            case .success(let dogData):
                self.dog = dogData
                DispatchQueue.main.async {
                    self.configureDogData(with: dogData)
                    self.tableView.reloadData()
                }
//                print(dogData)
            case .failure(let error):
//                print("Error: \(error)")
                self.displayError(error: error)
            }
        }
    }
    
    func configureDogData(with breeds: [DogModel]) {
        dogViewModel = breeds.map {breed in
            DogViewModel(name: breed.name,
                         description: breed.description,
                         weight: breed.weight.metric,
                         height: breed.height.metric,
                         lifespan: breed.lifeSpan,
                         imageRefId: breed.imageRefId,
                         temperament: breed.temperament,
                         bredFor: breed.bredFor)
        }
    }
    func displayError(error: NetworkError) {
        var title: String
        var message: String
        
        switch error {
        case .serverError:
            title = "Server Error"
            message = error.localizedDescription
        case .decodingError:
            title = "Decoding Error"
            message = error.localizedDescription
        case .invalidURL:
            title = "Invalid URL Error"
            message = error.localizedDescription
        }
        ShowAlert.showErrorAlert(from: self, title: title, message: message)
    }

}

// MARK: Data Source and Delegates
extension DogViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.cellId, for: indexPath) as! DogTableViewCell
        cell.textLabel?.text = dogViewModel[indexPath.row].name
        cell.configure(with: dogViewModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = AnimalDetailViewController()
        detailsVC.didSelectCell(withDogData: dogViewModel[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
