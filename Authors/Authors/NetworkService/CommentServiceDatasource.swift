//
//  CommentServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol CommentServiceDatasource: AnyObject {
    func getComments(postId: Int, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ())
}
