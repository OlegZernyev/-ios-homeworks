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
        setupView()
    }

    private func setupView() {
            view.addSubview(profileHeaderView)

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ])
        }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
}
