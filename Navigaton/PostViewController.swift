//
//  PostViewController.swift
//  Novigaton
//
//  Created by OlegZernyev on 17.05.2023.
//

import UIKit

class PostViewController: UIViewController {
    var postName: String?
    
    
    lazy var infoRightButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "info")?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(infoRightButtonTapped), for: .touchUpInside)
        return button
    }()
   
    lazy var barButtom = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoRightButtonTapped))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.isHidden = true
        navigationItem.rightBarButtonItem = barButtom
    }
    

    @objc private func infoRightButtonTapped() {
        let infoViewController = InfoViewController()
        present(infoViewController,animated: true)
    }
}
