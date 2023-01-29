//
//  DetailViewController.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    lazy var contentView = DetailView()
    var interactor: DetailInteractorDelegate?
    var router: DetailInternalRouterDelegate?
    var selectedPost: Post?
    
    var comments: [Comment] = [] {
        didSet {
            contentView.values = comments
            contentView.tableView.reloadData()
        }
    }
    
    init(selectedPost: Post) {
        super.init(nibName: nil, bundle: nil)
        self.selectedPost = selectedPost
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func loadView() {
        title = "Post Details"
        view = contentView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let request = DetailModel.Request(post: selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
        interactor?.showDetail(request: request)
    }
}

extension DetailViewController: DetailViewControllerDelegate {
    func presenter(didSuccessShowDetail presenterToView: DetailModel.ViewModel) {
        contentView.postTitleContentLabel.text = selectedPost?.title
        contentView.postDescriptionContentLabel.text = selectedPost?.body
        let author = AuthorInformation.shared.findAuthor(post: selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""), users: presenterToView.users)
        contentView.authorNameContentLabel.text = author.name
        contentView.authorEmailContentLabel.text = author.email
        contentView.authorPhoneContentLabel.text = author.phone
        guard let street = author.address?.street else { return }
        guard let zipcode = author.address?.zipcode else { return }
        guard let cityName = author.address?.city else { return }
        contentView.authorAddressContentLabel.text = "Street Name: \(street), Zipcode: \(zipcode), City Name: \(cityName)"
        comments = presenterToView.comments
    }
    
    func presenter(didFailShowDetail message: String) {
        
    }
}
