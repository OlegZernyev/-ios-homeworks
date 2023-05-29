//
//  PostTableViewCell.swift
//  Navigaton
//
//  Created by OlegZernyev on 29.05.2023.
//


import UIKit

class PostTableViewCell: UITableViewCell {

    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let likes: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let podlojkaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let postImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell(model: Post) {

        
        likes.text = "Likes: "
        + String( model.likes)
        
        views.text = "Views: "
        + String(model.views)
        
        postImgView.image = UIImage(named: model.image)
        authorLabel.text = model.author
        descriptionLabel.text = model.description
    }
        
        private func layout() {
            [podlojkaView, authorLabel,postImgView, descriptionLabel, likes, views].forEach { contentView.addSubview($0)
            }
        
            
            NSLayoutConstraint.activate([
                // contentWhiteView
                podlojkaView.topAnchor.constraint(equalTo: contentView.topAnchor),
                podlojkaView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                podlojkaView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                podlojkaView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                authorLabel.topAnchor.constraint(equalTo: podlojkaView.topAnchor, constant: 15),
                authorLabel.leadingAnchor.constraint(equalTo: podlojkaView.leadingAnchor, constant: 20),
                authorLabel.trailingAnchor.constraint(equalTo: podlojkaView.trailingAnchor, constant: 200),
                authorLabel.heightAnchor.constraint(equalToConstant: 30),
                
                postImgView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 25),
                postImgView.leadingAnchor.constraint(equalTo: podlojkaView.leadingAnchor),
                postImgView.trailingAnchor.constraint(equalTo: podlojkaView.trailingAnchor),
                postImgView.heightAnchor.constraint(equalToConstant: 200),
                
                descriptionLabel.topAnchor.constraint(equalTo: postImgView.bottomAnchor),
                descriptionLabel.leadingAnchor.constraint(equalTo: podlojkaView.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: podlojkaView.trailingAnchor),
                descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
                
                likes.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
                likes.leadingAnchor.constraint(equalTo: podlojkaView.leadingAnchor, constant: 20),
                likes.heightAnchor.constraint(equalToConstant: 50),
                likes.bottomAnchor.constraint(equalTo: podlojkaView.bottomAnchor),
                
                views.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
                views.trailingAnchor.constraint(equalTo: podlojkaView.trailingAnchor, constant: -20),
                views.heightAnchor.constraint(equalToConstant: 50),
                views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
            ])
        }
    }

