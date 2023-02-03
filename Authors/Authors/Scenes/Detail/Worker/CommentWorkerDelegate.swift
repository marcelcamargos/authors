//
//  CommentWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

protocol CommentWorkerDelegate {
    func getComments(postId: Int32, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ())
}
