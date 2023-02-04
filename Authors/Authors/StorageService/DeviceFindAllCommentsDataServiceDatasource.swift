//
//  DeviceFindAllCommentsDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceFindAllCommentsDataServiceDatasource {
    func findAllComments(post: Post, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ())
}
