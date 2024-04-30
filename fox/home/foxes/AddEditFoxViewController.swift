//
//  AddEditFoxViewController.swift
//  fox
//
//  Created by Gracie on 29/04/2024.
//

import UIKit

var foxArray : [FoxViewModel] = []

protocol AddEditFoxViewControllerDelegate: AnyObject {
    func createFox()
    func editFox()
}

class AddEditFoxViewController: UIViewController {
    
    weak var delegate: AddEditFoxViewControllerDelegate?

    var lifespans = ["10 - 12", "13 -15", "16 - 20", "20 -25"]
    let picker = UIPickerView()
    
    let uuid = UUID()
    
    lazy var breed: UITextField = {
        createTextField(placeholder: "Breed")
    }()
    
    lazy var desc: UITextField = {
        createTextField(placeholder: "Description")
    }()
    
    lazy var lifespan: UITextField = {
        createTextField(placeholder: "Lifespan")
    }()
    
    lazy var foxWeight: UITextField = {
        createTextField(placeholder: "Weight")
    }()
    
    lazy var randFact: UITextField = {
        createTextField(placeholder: "Fox fact")
    }()
    
    let tfHConst = CGFloat(16)
    let tfVConst = CGFloat(16)
    
    lazy var submitButton : UIButton = {
        let submit = UIButton(type: .roundedRect)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.layer.borderColor = UIColor.systemTeal.cgColor
        submit.layer.borderWidth = 1.0
        submit.layer.cornerRadius = 8.0
        submit.setTitle("SUBMIT", for: .normal)
        submit.setTitleColor(.systemTeal, for: .normal)
        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        return submit
    }()
    
    
    var breedValue: String? {
        return breed.text
    }
    
    var descValue: String? {
        return desc.text
    }

    var lifespanValue: String? {
        return lifespan.text
    }
    
    var weightValue: String? {
        return foxWeight.text
    } 
    
    var randFactValue: String? {
        return randFact.text
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        setLayout()
    }

    private func setLayout() {
        setBreed()
        setDesc()
        setWeight()
        setRandFact()
        setLifeSpan()
        setSubmitBtn()
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = "\(placeholder): "
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 1.0
            textField.layer.cornerRadius = 8.0
            textField.font = UIFont.systemFont(ofSize: 16.0)
        return textField
    }
}

//MARK: Layout setup
extension AddEditFoxViewController{
    private func setBreed(){
        view.addSubview(breed)
        
        NSLayoutConstraint.activate([
            breed.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            breed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tfHConst),
            breed.heightAnchor.constraint(equalToConstant: 50),
            breed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tfHConst),
        ])
    }
    
    private func setDesc(){
        view.addSubview(desc)
        
        NSLayoutConstraint.activate([
            desc.topAnchor.constraint(equalTo: breed.bottomAnchor, constant: tfVConst),
            desc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tfHConst),
            desc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tfHConst),
            desc.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func setWeight(){
        view.addSubview(foxWeight)
        
        NSLayoutConstraint.activate([
            foxWeight.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: tfVConst),
            foxWeight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tfHConst),
            foxWeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tfHConst),
            foxWeight.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setRandFact(){
        view.addSubview(randFact)
        
        NSLayoutConstraint.activate([
            randFact.topAnchor.constraint(equalTo: foxWeight.bottomAnchor, constant: tfVConst),
            randFact.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tfHConst),
            randFact.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tfHConst),
            randFact.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setLifeSpan() {
        view.addSubview(lifespan)
        lifespan.inputView = picker
        NSLayoutConstraint.activate([
            lifespan.topAnchor.constraint(equalTo: randFact.bottomAnchor, constant: tfVConst),
            lifespan.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tfHConst),
            lifespan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tfHConst),
            lifespan.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setSubmitBtn() {
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tfVConst),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tfVConst),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tfVConst),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension AddEditFoxViewController{
    private func sendData(){
        guard let breedValue = breedValue,
              let descValue = descValue,
              let weightValue = weightValue
        else {
            // show error stating that the fields are nil
            return
        }
        let foxData = FoxViewModel(id: uuid.uuidString,
                                   breed: breedValue,
                                   description: descValue,
                                   weight: weightValue,
                                   lifespan: lifespan.text ?? "20 - 25",
                                   randFact: randFactValue ?? "")
        foxArray.append(foxData)
        print("Number of foxes: \(foxArray.count)")
    }
}
//MARK: Picker delegate and datasource
extension AddEditFoxViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lifespans.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lifespans[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lifespan.text = lifespans[row]
        lifespan.resignFirstResponder()
    }
}


//MARK: Actions
    extension AddEditFoxViewController{
        @objc func submitTapped(){
            //TODO: post data
            sendData()
//            delegate?.createFox()
            navigationController?.popViewController(animated: true)
        }
    }
