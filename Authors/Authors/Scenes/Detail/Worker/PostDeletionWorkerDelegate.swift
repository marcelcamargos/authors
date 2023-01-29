//
//  PostDeletionWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

protocol PostDeletionWorkerDelegate {
    func deletePost(postId: Int, success: @escaping (String) -> (), fail: @escaping (String) -> ())
}
