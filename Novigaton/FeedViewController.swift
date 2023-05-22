//
//  FeedViewController.swift
//  Novigaton
//
//  Created by OlegZernyev on 17.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)

        return button
    }()
    
    let postName: Post = .init(title: "Пост №1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        
        view.addSubview(postButton)
        
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 50),
            postButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func showPost () {
        let postViewController = PostViewController()
        postViewController.postName = postName.title
        //немодальное переход
        navigationController?.pushViewController(postViewController, animated: true)
    }
}


