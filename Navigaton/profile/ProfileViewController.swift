//
//  ProfileViewController.swift
//  Novigaton
//
//  Created by OlegZernyev on 17.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    //MARK: - Properties


    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)

        

        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private var dataPosts = Post.createPost()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true

    }
    //MARK: - Functions
        
    private func addSubviews(){
        view.addSubview(tableView)
    }
    

    //MARK: - Constraints

    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return  dataPosts.count
        }    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: dataPosts[indexPath.row])
            cell.viewPlus = {
                let onePostVC = OnePostVC()
                self.dataPosts[indexPath.row].views += 1
                self.tableView.reloadData()
                onePostVC.detailPost = self.dataPosts[indexPath.row]
                onePostVC.parentNavigationControler = self.navigationController
                self.navigationController?.present(onePostVC, animated: true)
            }
        
            cell.likePlus = {
//                if !self.postFeed[indexPath.row].isLike {
                    self.dataPosts[indexPath.row].likes += 1
//                    self.postFeed[indexPath.row].isLike = true
                    self.tableView.reloadData()
//                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController()
        if indexPath.section == 0 {
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
    
}
extension ProfileViewController: UITableViewDelegate {
}

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
