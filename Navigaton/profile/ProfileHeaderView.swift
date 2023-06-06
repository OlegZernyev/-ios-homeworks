//
//  ProfileHeaderView.swift
//  Navigaton
//
//  Created by OlegZernyev on 19.05.2023.
//



import UIKit
class ProfileHeaderView: UIView {
    

    private var statusText: String = ""

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(button)
        addSubview(statusTextFeld)
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
                
                statusTextFeld.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
                statusTextFeld.heightAnchor.constraint(equalToConstant: 40),
                statusTextFeld.widthAnchor.constraint(equalToConstant: 200),
                statusTextFeld.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                statusTextFeld.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ])
        }

    @objc func buttonPressed() {
       
        if let text =  statusTextFeld.text {
            subtitleLabel.text = text
            if subtitleLabel.text == "" {
                subtitleLabel.text = " "
            }
            print(text)}
    }
}
