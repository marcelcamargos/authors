//
//  DetailPresenterDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol DetailPresenterDelegate: AnyObject {
    func interactor(didSuccessShowDetail response: DetailModel.Response)
    func interactor(didFailShowDetail error: String)
    func interactor(didSuccessDeletion response: DeletionModel.Response)
    func interactor(didFailDeletion error: String)
    func interactor(didSuccessSaveCoreData response: CoreDataModel.Response)
    func interactor(didFailSaveCoreData error: String)
}
