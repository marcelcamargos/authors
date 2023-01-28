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
        uiLabel.textAlignment = .center
        uiLabel.font = uiLabel.font.withSize(30)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()

    public lazy var postDescriptionLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = uiLabel.font.withSize(24)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    public lazy var longDescriptionLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = uiLabel.font.withSize(16)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
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
        stackView.addArrangedSubview(postDescriptionLabel)
        stackView.addArrangedSubview(longDescriptionLabel)
        addSubview(stackView)
    }
  
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
