//
//  DogDetailViewController.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import UIKit
class AnimalDetailViewController: UIViewController {
    var catViewModel: CatViewModel?
    var dogViewModel: DogViewModel?
    var imageUrl: String = ""
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    lazy var imageContainer: UIView = {
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        return imageContainer
    }()
    
    lazy var attrStackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .fillProportionally
        return stackview
    }()
    
    lazy var charStackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .fillProportionally
        return stackview
    }()
    
    lazy var detailsLabel: UILabel = { createLabel() }()

    lazy var weightTitle: UILabel = { createLabel() }()
    
    lazy var weightLabel: UILabel = { createLabel() }()
    
    lazy var lifespanLabel: UILabel = { createLabel() }()
    
    lazy var originTitle: UILabel = { createLabel() }()
    
    lazy var originLabel: UILabel = { createLabel() }()
    
    lazy var temperamentTitle: UILabel = { createLabel() }()

    lazy var temperament: UILabel = { createLabel() }()
    lazy var adaptability: UILabel = { createLabel() }()
    lazy var affectionLevel: UILabel = { createLabel() }()
    lazy var childFriendly: UILabel = { createLabel() }()
    lazy var dogFriendly: UILabel = { createLabel() }()
    lazy var strngerFriendly: UILabel = { createLabel() }()
    lazy var energyLevel: UILabel = { createLabel() }()
    lazy var intelligence: UILabel = { createLabel() }()
    lazy var vocalization: UILabel = { createLabel() }()
        
    lazy var firstImageView: UIImageView = {
        let firstImageView = UIImageView()
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.contentMode = .scaleAspectFit
        return firstImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
//        fetchImage()
    }
    
    func setUpViews(){
        setupScrollView()
        setupImageContainer()
        setupImage()
        setupDescription()
        setupAttrStack()
        setupTemperamentTitle()
        setupTemperament()
        setupCharStack()
    }
    
}

//MARK: Layout
extension AnimalDetailViewController {
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupImageContainer() {
        contentView.addSubview(imageContainer) // Add to contentView instead of scrollView
        
        NSLayoutConstraint.activate([
            imageContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ])
    }

    private func setupImage() {
        imageContainer.addSubview(firstImageView)
        
        NSLayoutConstraint.activate([
            firstImageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            firstImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            firstImageView.heightAnchor.constraint(equalTo: imageContainer.heightAnchor, multiplier: 0.8),
            firstImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            firstImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
       ])
    }

    private func setupDescription() {
        contentView.addSubview(detailsLabel)
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            detailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            detailsLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func setupAttrStack() {
        attrStackview.addArrangedSubview(weightLabel)
        attrStackview.addArrangedSubview(lifespanLabel)
        attrStackview.addArrangedSubview(originLabel)
        contentView.addSubview(attrStackview)
        
        NSLayoutConstraint.activate([
            attrStackview.topAnchor.constraint(equalToSystemSpacingBelow: detailsLabel.bottomAnchor, multiplier: 1),
            attrStackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            attrStackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            attrStackview.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupTemperamentTitle() {
        contentView.addSubview(temperamentTitle)
        
        NSLayoutConstraint.activate([
            temperamentTitle.topAnchor.constraint(equalToSystemSpacingBelow: attrStackview.bottomAnchor, multiplier: 1),
            temperamentTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            temperamentTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            temperamentTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

    private func setupTemperament() {
        contentView.addSubview(temperament)
        
        NSLayoutConstraint.activate([
            temperament.topAnchor.constraint(equalToSystemSpacingBelow: temperamentTitle.bottomAnchor, multiplier: 1),
            temperament.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            temperament.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            temperament.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCharStack() {
        
    }
}

//MARK: Some Functions
extension AnimalDetailViewController {
    private func createLabel(text: String = "Weight") -> UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }
//    private func formatString(title: String, text: String) -> NSAttributedString {
//        let titleAttrs : [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .caption1)]
//        let textAttrs : [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .body)]
//        let titleString = NSAttributedString(string: title, attributes: titleAttrs)
//        let textString = NSAttributedString(string: text, attributes: textAttrs)
//        let mutableAttributedString = NSMutableAttributedString(attributedString: titleString)
//        mutableAttributedString.append(textString)
//        return mutableAttributedString
//    }
    private func formatString(title: String, text: String) -> NSAttributedString {
        let titleAttrs: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .caption1)]
        let textAttrs: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .body)]
        
        let titleString = NSAttributedString(string: title + "\n", attributes: titleAttrs)
        let textString = NSAttributedString(string: text, attributes: textAttrs)
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: titleString)
            mutableAttributedString.append(textString)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        paragraphStyle.lineHeightMultiple = 1.0
        
        // Apply paragraph style to the entire range of the mutableAttributedString
        mutableAttributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: mutableAttributedString.length))
        
        return mutableAttributedString
    }

}

// MARK: Fetch Image
extension AnimalDetailViewController {
     func fetchImageData(breedId: String, 
                         animal: String,
                         param: String,
                         completion: @escaping (Result<[ImageRef], NetworkError>) -> Void) {
        let url = "https://api.the\(animal)api.com/v1/images/search?\(param)=\(breedId)"
         
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
                let result: [ImageRef] = try JSONDecoder().decode([ImageRef].self, from: data)
                completion(.success(result))
//                print(result)
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

//MARK: Load Cat Data
extension AnimalDetailViewController: CatTableCellDelegate {
    func didSelectCell(withCatData data: CatViewModel) {
        fetchImageData(breedId: data.id, animal: "cat", param: "breed_ids") { result in
            switch result {
            case .success(let imageData):
                // Ensure that there is at least one image URL in the imageData array
                if let imageUrlString = imageData.first?.url {
                    // Convert imageUrlString to URL
                    if let imageUrl = URL(string: imageUrlString) {
                        // Download image data asynchronously
                        DispatchQueue.global().async {
                            if let imageData = try? Data(contentsOf: imageUrl) {
                                // Create UIImage from downloaded data on the main thread
                                DispatchQueue.main.async {
                                    self.firstImageView.image = UIImage(data: imageData)
                                }
                            } else {
                                print("Error: Unable to load image data from URL")
                            }
                        }
                    } else {
                        print("Error: Invalid image URL")
                    }
                } else {
                    print("Error: No image URL found in the imageData array")
                }
            case .failure(let error):
                self.displayError(error: error)
                print("Error: \(error)")
            }
        }
        
        self.weightLabel.attributedText = self.formatString(title: "Weight", text: data.weight)
        self.detailsLabel.text = data.description
        self.lifespanLabel.attributedText = self.formatString(title: "Lifespan", text: data.lifeSpan)
        self.originLabel.attributedText = self.formatString(title: "Origin", text: data.origin)
        self.temperamentTitle.text = "Temperament"
        self.temperament.text = data.temperament
    }
}

//MARK: Display Error
extension AnimalDetailViewController {
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

//MARK: Load Dog Data
extension AnimalDetailViewController: DogTableCellDelegate {
    func didSelectCell(withDogData data: DogViewModel) {
        fetchImageData(breedId: data.imageRefId, animal: "dog", param: "reference_image_id") { result in
            switch result {
            case .success(let imageData):
                // Ensure that there is at least one image URL in the imageData array
                if let imageUrlString = imageData.first?.url {
                    // Convert imageUrlString to URL
                    if let imageUrl = URL(string: imageUrlString) {
                        // Download image data asynchronously
                        DispatchQueue.global().async {
                            if let imageData = try? Data(contentsOf: imageUrl) {
                                // Create UIImage from downloaded data on the main thread
                                DispatchQueue.main.async {
                                    self.firstImageView.image = UIImage(data: imageData)
                                }
                            } else {
                                print("Error: Unable to load image data from URL")
                            }
                        }
                    } else {
                        print("Error: Invalid image URL")
                    }
                } else {
                    print("Error: No image URL found in the imageData array")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        let someText = data.description ?? data.bredFor ?? data.name
        
        self.weightLabel.attributedText = self.formatString(title: "Weight", text: data.weight)
        self.detailsLabel.text = "Description: \(someText)"
        self.lifespanLabel.attributedText = self.formatString(title: "Lifespan", text: data.lifespan)
        self.originLabel.attributedText = self.formatString(title: "Height", text: data.height)
        self.temperamentTitle.text = "Temperament"
        self.temperament.text = data.temperament
    }
    
    
}
