//
//  ProfileViewController.swift
//  Novigaton
//
//  Created by OlegZernyev on 17.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        
        setupView()
    }
    
    private let newButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кнопка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setupView() {
            view.addSubview(profileHeaderView)

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                
                
                newButton.heightAnchor.constraint(
                    equalToConstant: 50),
                newButton.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 0),
                newButton.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: 0),
                newButton.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: 0),
                
                
//                profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            ])
        }
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        profileHeaderView.frame = view.frame
//    }
}
