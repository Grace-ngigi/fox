//
//  ShowAlert.swift
//  fox
//
//  Created by Gracie on 26/04/2024.
//

import UIKit

struct ShowAlert {
    static func showErrorAlert(from viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}


