//
//  CommentAllWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

protocol CommentAllWorkerDelegate {
    func getAllComments(success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ())
}
