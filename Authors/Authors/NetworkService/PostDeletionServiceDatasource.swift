//
//  PostDeletionServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol PostDeletionServiceDatasource: AnyObject {
    func processDeletion(postId: Int, success: @escaping (String) -> (), fail: @escaping (String) -> ())
}
