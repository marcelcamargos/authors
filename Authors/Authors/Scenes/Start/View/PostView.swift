//
//  PostView.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class PostView: UIView {
    var values: [Post] = []
    var favourites: [Post] = []
    
    weak var delegate: PostViewDelegate?
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
        tableView.allowsSelection = true
        return tableView
    }()
    
    init(delegate: PostViewDelegate) {
        super.init(frame: .zero)
        backgroundColor = .white
        self.delegate = delegate
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension PostView: ViewCodable {
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive  = true
    }
}

extension PostView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didClickItem(selectedPost: values[indexPath.row])
    }
}

extension PostView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if values.count > favourites.count {
            return values.count
        }
        return favourites.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostCell()
        Organizer.shared.organize(posts: &values, favourites: favourites)
        cell.nameLabel.text = values[indexPath.row].title
        cell.setUpCell(fill: Matcher.shared.match(post: values[indexPath.row], favourites: favourites))
        return cell
    }
}
