//
//  PhotosCollectionViewCell.swift
//  Navigaton
//
//  Created by OlegZernyev on 03.06.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func imageCellTaped(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}


final class PhotosCollectionViewCell: UICollectionViewCell {
    

    
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFullPhoto)))
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCell() {
    }
    
    func setupCell(model: PostImages) {
        imageView.image = UIImage(named: model.image)
    }
    
    private func addSubviews(){
        contentView.addSubview(imageView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
    
        ])
    }
    
    
    var showPhoto: (() -> Void)? = nil
    @objc func tapFullPhoto() {
        if let action = self.showPhoto { action() }
    }


    
}
