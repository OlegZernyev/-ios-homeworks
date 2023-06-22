//
//  ProfileHeaderView.swift
//  Navigaton
//
//  Created by OlegZernyev on 19.05.2023.
//



import UIKit
class ProfileHeaderView: UIView {
    

    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTap)))
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var statusText: String = ""

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTap)))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var  button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushStatus), for: .touchUpInside)
        return button
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusTextFeld: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.placeholder = "status..."
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(button)
        addSubview(statusTextFeld)
        addSubview(backView)
        addSubview(imageView)
        addSubview(closeButton)

    }
        
            private  func setupLayoutConstraint() {
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                imageView.widthAnchor.constraint(equalToConstant: 120),
                imageView.heightAnchor.constraint(equalToConstant: 120),
                
                titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                titleLabel.widthAnchor.constraint(equalToConstant: 100),
                
                subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
                subtitleLabel.widthAnchor.constraint(equalToConstant: 150),
                
                button.topAnchor.constraint(equalTo: statusTextFeld.bottomAnchor, constant: 15),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 50),
                button.bottomAnchor.constraint(equalTo: bottomAnchor),
                button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                
                statusTextFeld.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
                statusTextFeld.heightAnchor.constraint(equalToConstant: 40),
                statusTextFeld.widthAnchor.constraint(equalToConstant: 200),
                statusTextFeld.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                statusTextFeld.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                closeButton.widthAnchor.constraint(equalToConstant: 30),
                closeButton.heightAnchor.constraint(equalToConstant: 30),
                
                backView.leadingAnchor.constraint(equalTo: leadingAnchor),
                backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                backView.topAnchor.constraint(equalTo: topAnchor),
                backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        }

    @objc func pushStatus() {
       
        if let text =  statusTextFeld.text {
            subtitleLabel.text = text
            if subtitleLabel.text == "" {
                subtitleLabel.text = " "
                statusTextFeld.backgroundColor = UIColor(red: 240, green: 0, blue: 0, alpha: 0.3)
                subtitleLabel.text = " "
            }
            print(text)}
    }
    
    
    @objc private func avatarTap() {
        
        let widthScreen = UIScreen.main.bounds.width
        let heightScreen = UIScreen.main.bounds.width * 2
        
        UIView.animate(withDuration: 0.2, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 4, y: 4)
       
            self.backView.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: widthScreen, height: heightScreen))
            
            self.imageView.center = self.backView.center
            self.imageView.layer.cornerRadius = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
                self.backView.alpha = 0.5
            }
        }
    }
    
    @objc private func closeButtonTap() {
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0
            self.backView.alpha = 0

        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.imageView.frame = .init(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
                self.imageView.transform = .identity
                self.imageView.layer.cornerRadius = 50
            })
        }
    }
    
}
