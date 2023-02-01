//
//  PostInteractorDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import UIKit

protocol PostInteractorDelegate: AnyObject {
    func fetchPosts(uiViewController: UIViewController)
    func saveAllToCoreData(request: StartCoreDataModel.Request)
    //func tryConnect(favourite: Bool, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
    func deleteAllData(request: DeleteAllPostCoreDataModel.Request)
}
