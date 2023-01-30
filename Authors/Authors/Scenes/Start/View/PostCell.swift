//
//  PostCell.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

final class PostCell: UITableViewCell {

    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    public lazy var starButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setUpCell() {
        setupView()
    }
}

extension PostCell: ViewCodable {
    func buildHierarchy() {
        self.addSubview(nameLabel)
        self.addSubview(starButton)
    }
    
    func setupConstraints() {
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true

        starButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16).isActive = true
        starButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        starButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
