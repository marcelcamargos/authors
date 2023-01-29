//
//  DetailView.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class DetailView: UIView {
    public lazy var postTitleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "Post Title"
        return uiLabel
    }()
    
    public lazy var postTitleContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = uiLabel.font.withSize(12)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()

    public lazy var postDescriptionLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "Post Description"
        return uiLabel
    }()
    
    public lazy var postDescriptionContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = uiLabel.font.withSize(12)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    public lazy var authorNameLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "Author Name"
        return uiLabel
    }()
    
    public lazy var authorNameContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = uiLabel.font.withSize(12)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    public lazy var authorEmailLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "Author Email"
        return uiLabel
    }()
    
    public lazy var authorEmailContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = uiLabel.font.withSize(12)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    public lazy var authorPhoneLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "Author Phone"
        return uiLabel
    }()
    
    public lazy var authorPhoneContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = uiLabel.font.withSize(12)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    public lazy var authorAddressLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "Author Address"
        return uiLabel
    }()
    
    public lazy var authorAddressContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = uiLabel.font.withSize(12)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}

extension DetailView: ViewCodable {
    func buildHierarchy() {
        stackView.addArrangedSubview(postTitleLabel)
        stackView.addArrangedSubview(postTitleContentLabel)
        stackView.addArrangedSubview(postDescriptionLabel)
        stackView.addArrangedSubview(postDescriptionContentLabel)
        stackView.addArrangedSubview(authorNameLabel)
        stackView.addArrangedSubview(authorNameContentLabel)
        stackView.addArrangedSubview(authorEmailLabel)
        stackView.addArrangedSubview(authorEmailContentLabel)
        stackView.addArrangedSubview(authorPhoneLabel)
        stackView.addArrangedSubview(authorPhoneContentLabel)
        stackView.addArrangedSubview(authorAddressLabel)
        stackView.addArrangedSubview(authorAddressContentLabel)

        addSubview(stackView)
    }
  
    func setupConstraints() {
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}
