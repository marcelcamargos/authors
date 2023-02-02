//
//  PostServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol PostServiceDatasource: AnyObject {
    func getPosts(success: @escaping([Post]) -> (), fail: @escaping(_ message: String) -> ())
}
