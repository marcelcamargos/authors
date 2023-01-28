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
    }
    
    func presenter(didFailShowDetail message: String) {
        
    }
}
