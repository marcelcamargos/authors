//
//  PostViewController.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

class PostViewController: UIViewController {
    public var interactor: PostInteractorDelegate?
    public var router: PostInternalRouterDelegate?
    private var errorMessage: String = ""
    private var contentView: PostView?
    
    var displayedItems: [Post] = [] {
        didSet {
            contentView?.values = displayedItems
            contentView?.tableView.reloadData()
        }
    }

    var myFavourites: [Post] = [] {
        didSet {
            contentView?.favourites = myFavourites
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        title = "Posts"
        contentView = PostView(delegate: self)
        view = contentView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarButton = UIBarButtonItem(title: "Delete All", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.deleteAllTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton

    }
    
    @objc func deleteAllTapped(_ sender: UIBarButtonItem)
    {
        showDialog()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.fetchPosts(uiViewController: self)
    }
}

extension PostViewController: PostViewControllerDelegate {
    func presenter(didSuccessShowPost presenterToView: PostModel.ViewModel) {
        displayedItems = presenterToView.items
        myFavourites = presenterToView.favourites
    }
    
    func presenter(didFailShowPost message: String) {
        errorMessage = message
    }
}

extension PostViewController: PostViewDelegate {
    func didClickItem(selectedPost: Post) {
        router?.showDetail(selectedPost: selectedPost)
    }
}

extension PostViewController {
    func showDialog() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete all posts except favourites? \n If you reopen the app, an internet connection will be made and the posts are going to be restored. In case you are not connected when reopening, just those posts marked as favourites will be shown for you if you have them.", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "YES", style: .default, handler: { (action) -> Void in
            //let request = DeletionModel.Request(post: self.selectedPost ?? Post(userId: -1, id: -1, title: "", body: ""))
            //self.interactor?.processDelete(request: request)
            //self.navigationController?.popToRootViewController(animated: true)
            print("Deletion Allowed")
        })
        
        let no = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
            print("Deletion not Allowed")
        }
        
        dialogMessage.addAction(yes)
        dialogMessage.addAction(no)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
