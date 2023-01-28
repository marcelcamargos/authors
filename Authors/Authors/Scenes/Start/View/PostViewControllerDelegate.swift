//
//  PostViewControllerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostViewControllerDelegate: AnyObject {
    func presenter(didSuccessShowPost presenterToView: PostModel.ViewModel)
    func presenter(didFailShowPost message: String)
}
