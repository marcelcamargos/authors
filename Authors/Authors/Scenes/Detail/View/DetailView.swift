//
//  DetailView.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func defineFavourite(favourite: Bool)
}

class DetailView: UIView {
    
    weak var delegate: DetailViewDelegate?
    var buttonState: Bool = false
    
    public lazy var starButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Mark as Favourite", for: .normal)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
    
    public lazy var commentsLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
        uiLabel.text = "COMMENTS:"
        return uiLabel
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.allowsSelection = true
        return tableView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var values: [Comment] = []

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
        stackView.addArrangedSubview(starButton)
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
        stackView.addArrangedSubview(commentsLabel)
        addSubview(stackView)
        
        addSubview(tableView)
    }
  
    func setupConstraints() {
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func applyAdditionalChanges() {
        starButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
}

extension DetailView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CommentCell()
        cell.nameLabel.text = values[indexPath.row].body
        cell.setUpCell()
        return cell
    }
}

extension DetailView {
    @objc func buttonAction(sender: UIButton) {
        if buttonState {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            delegate?.defineFavourite(favourite: false)
        } else {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            delegate?.defineFavourite(favourite: true)
        }
    }
}
