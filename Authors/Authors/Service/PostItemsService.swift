//
//  PostItemsService.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostItemsServiceDatasource: AnyObject {
    func getSimpleListOfItems(success: @escaping([String]) -> (), fail: @escaping(_ message: String) -> ())
}

class PostItemsService: PostItemsServiceDatasource {
    func getSimpleListOfItems(success: @escaping ([String]) -> (), fail: @escaping (String) -> ()) {
        let items = ["post 1", "post 2", "post 3", "post 4", "post 5", "post 6", "post 7"]
        success(items)
    }
}
