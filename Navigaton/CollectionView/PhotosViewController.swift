//
//  PhotosViewController.swift
//  Navigaton
//
//  Created by OlegZernyev on 03.06.2023.
//

import UIKit


class PhotosViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(
            PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let postImages = PostImages.generatetCV()

    
//    --
    private lazy var fullIV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0.0
        
        return imageView
    }()
    
    private let blackLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.0
        return view
    }()
    

    private lazy var closePhoto: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.tintColor = .red
        button.alpha = 0
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClosePhoto)))
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    
//    --
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        
        addSubviews()
        setupContraints()
        
        title = "Gallery"
    }
    
    private func addSubviews(){
        view.addSubview(collectionView)
        view.addSubview(blackLayer)
        view.addSubview(fullIV)
        view.addSubview(closePhoto)
    }
    
    private func setupContraints() {
        
        leadingImageView = fullIV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        
        topImageView = fullIV.leadingAnchor.constraint(equalTo: view.leadingAnchor,
constant: 16)
        widthImageView = fullIV.leadingAnchor.constraint(equalTo: view.leadingAnchor,
constant: 16)
        heightImageView = fullIV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            blackLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blackLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blackLayer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            fullIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullIV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            closePhoto.widthAnchor.constraint(equalToConstant: 30),
            closePhoto.heightAnchor.constraint(equalToConstant: 30),
            closePhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closePhoto.trailingAnchor.constraint(equalTo: fullIV.trailingAnchor, constant: -30),
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: postImages[indexPath.item])
        
        cell.showPhoto  = {
            UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {

                self.fullIV.layer.opacity = 1
                    self.closePhoto.layer.opacity = 1

                    self.fullIV.image = UIImage(named:self.postImages[indexPath.row].image)
                    self.widthImageView.constant = UIScreen.main.bounds.width - 20
                    self.leadingImageView.constant = 0
                    self.trailingImageView.constant = 0
                    self.topImageView.constant = 20
                }
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                        self.blackLayer.layer.opacity = 0.5
                    }
            }
        }
        return cell
    }
    
    @objc private func tapClosePhoto() {
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.fullIV.layer.opacity = 0.0
                self.closePhoto.layer.opacity = 0.0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.blackLayer.layer.opacity = 0.0
            }
        }
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}
