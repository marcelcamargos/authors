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
    
    var displayedItems: [String] = [] {
        didSet {
            contentView?.values = displayedItems
            contentView?.tableView.reloadData()
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
        interactor?.fetchData()
    }
    
    func extactToList(posts: [Post]) -> [String] {
        var innerPosts: [String] = []
        for post in posts {
            innerPosts.append(post.title)
        }
        return innerPosts
    }
}

extension PostViewController: PostViewControllerDelegate {
    func presenter(didSuccessShowPost presenterToView: PostModel.ViewModel) {
        displayedItems = extactToList(posts: presenterToView.items)
    }
    
    func presenter(didFailShowPost message: String) {
        errorMessage = message
    }
}

extension PostViewController: PostViewDelegate {
    func didClickFirstItem() {
        router?.showDetail()
    }
}
