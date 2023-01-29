//
//  CommentCell.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import UIKit

final class CommentCell: UITableViewCell {

    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 3
        nameLabel.lineBreakMode = .byTruncatingTail
        return nameLabel
    }()

    func setUpCell() {
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
}
