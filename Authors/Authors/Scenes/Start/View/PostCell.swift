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

    func setUpCell() {
        
        self.addSubview(nameLabel)

        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
