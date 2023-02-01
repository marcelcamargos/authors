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
    func presenter(didSuccessSaveAllCoreData presenterToView: StartCoreDataModel.ViewModel)
    func presenter(didFailSaveAllCoreData message: String)
    func presenter(didSuccessDeleteAllCoreData presenterToView: DeleteAllPostCoreDataModel.ViewModel)
    func presenter(didFailDeleteAllCoreData message: String)
}
