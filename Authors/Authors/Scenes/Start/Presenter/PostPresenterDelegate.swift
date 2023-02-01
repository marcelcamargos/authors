//
//  PostPresenterDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostPresenterDelegate: AnyObject {
    func interactor(didSuccessShowPost response: PostModel.Response)
    func interactor(didFailShowPost error: String)
    func interactor(didSuccessSaveAllCoreData response: StartCoreDataModel.Response)
    func interactor(didFailSaveAllCoreData error: String)
    func interactor(didSuccessDeleteAllCoreData response: DeleteAllPostCoreDataModel.Response)
    func interactor(didFailDeleteAllCoreData error: String)
}
