//
//  InfoViewController.swift
//  Novigaton
//
//  Created by OlegZernyev on 17.05.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(runAlert), for: .touchUpInside)

        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        view.addSubview(alertButton)


        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
            alertButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        
        
        
    }
    
    @objc func runAlert() {
        showAlert(title: "Заголовок уведомления", message: "Текст уведомления.")
        
        
    }
    
    @objc func returnScreen() {
        dismiss(animated: true)
    }
}


extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            print("Ок")
        }
        let okCancel = UIAlertAction(title: "Cancel", style: .default) {_ in
            print("Cancel")
        }
        alert.addAction(okAction)
        alert.addAction(okCancel)
        present(alert, animated: true)  // вывод алерта
    }
    
}
