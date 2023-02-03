//
//  DeviceFindAllCommentsDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

protocol DeviceFindAllCommentsDataWorkerDelegate {
    func findAllCommentsData(post: Post, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ())
}
