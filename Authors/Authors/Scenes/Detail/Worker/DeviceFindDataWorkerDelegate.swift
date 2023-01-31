//
//  DeviceFindDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import Foundation

protocol DeviceFindDataWorkerDelegate {
    func findByPost(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
