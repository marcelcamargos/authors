//
//  DetailInteractorDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

protocol DetailInteractorDelegate: AnyObject {
    func showDetail(request: DetailModel.Request)
    func processDelete(request: DeletionModel.Request)
    func saveToCoreData(request: CoreDataModel.Request)
    func findByPost(request: FindCoreDataModel.Request)
    func deleteData(request: FindCoreDataModel.Request)
    func saveAllUserToCoreData(request: DetailCoreDataModel.Request)
    func saveAllCommentsToCoreData(request: CommentCoreDataModel.Request)
}
