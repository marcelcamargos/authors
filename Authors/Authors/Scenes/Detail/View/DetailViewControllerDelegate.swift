//
//  DetailViewControllerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol DetailViewControllerDelegate: AnyObject {
    func presenter(didSuccessShowDetail presenterToView: DetailModel.ViewModel)
    func presenter(didFailShowDetail message: String)
    func presenter(didSuccessDeletion presenterToView: DeletionModel.ViewModel)
    func presenter(didFailDeletion message: String)
    func presenter(didSuccessSaveCoreData presenterToView: CoreDataModel.ViewModel)
    func presenter(didFailSaveCoreData message: String)
    func presenter(didSuccessFindCoreData presenterToView: FindCoreDataModel.ViewModel)
    func presenter(didFailFindCoreData message: String)
    func presenter(didSuccessDeletionCoreData presenterToView: FindCoreDataModel.ViewModel)
    func presenter(didFailDeletionCoreData message: String)
    func presenter(didSuccessSaveUsersCoreData: DetailCoreDataModel.ViewModel)
    func presenter(didFailSaveUsersCoreData: String)
    func presenter(didSuccessSaveCommentsCoreData: CommentCoreDataModel.ViewModel)
    func presenter(didFailSaveCommentsCoreData: String)
}
