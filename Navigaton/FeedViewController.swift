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
        button.frame = CGRect(origin: CGPoint(x: 120, y: 370), size: CGSize(width: 150, height: 50))
        button.tintColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)

        return button
    }()
    
        let postName = Post(title: "Пост")

    
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


