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
    var starState: Bool?
    
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
        contentView.delegate = self
        view = contentView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let request = DetailModel.Request(post: selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
        interactor?.showDetail(request: request)
        
        let findRequest = FindCoreDataModel.Request(post: selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
        interactor?.findByPost(request: findRequest)
        
        let rightBarButton = UIBarButtonItem(title: "Delete", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.deleteItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func deleteItemTapped(_ sender: UIBarButtonItem)
    {
        showDialog()
    }
    
    func setButtonState(result: Bool) {
        if !result {
            contentView.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            contentView.starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        contentView.buttonState = result
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
    
    func presenter(didSuccessDeletion presenterToView: DeletionModel.ViewModel) {
        
    }
    
    func presenter(didFailDeletion message: String) {
        
    }
    
    func presenter(didSuccessSaveCoreData presenterToView: CoreDataModel.ViewModel) {
        setButtonState(result: presenterToView.result)
    }
    
    func presenter(didFailSaveCoreData message: String) {
        
    }
    
    func presenter(didSuccessFindCoreData presenterToView: FindCoreDataModel.ViewModel) {
        setButtonState(result: presenterToView.result)
    }
    
    func presenter(didFailFindCoreData message: String) {
        
    }
    
    func presenter(didSuccessDeletionCoreData presenterToView: FindCoreDataModel.ViewModel) {
        
    }
    
    func presenter(didFailDeletionCoreData message: String) {
        
    }
}

extension DetailViewController {
    func showDialog() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this post?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            let request = DeletionModel.Request(post: self.selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
            self.interactor?.processDelete(request: request)
            self.navigationController?.popToRootViewController(animated: true)
        })
        
        let no = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
            print("Deletion not Allowed")
        }
        
        dialogMessage.addAction(yes)
        dialogMessage.addAction(no)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

extension DetailViewController: DetailViewDelegate {
    func defineFavourite() {
        let request = CoreDataModel.Request(post: selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
        interactor?.saveToCoreData(request: request)
    }
    
    func deleteData(post: Post) {
        let request = FindCoreDataModel.Request(post: selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
        interactor?.deleteData(request: request)
    }
}
