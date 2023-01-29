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
    
    init(selectedPost: Post) {
        super.init(nibName: nil, bundle: nil)
        self.selectedPost = selectedPost
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = contentView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.showDetail()
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
    }
    
    func presenter(didFailShowDetail message: String) {
        
    }
}
