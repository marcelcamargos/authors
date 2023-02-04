//
//  DeviceFindDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceFindDataServiceDatasource {
    func findByPost(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
    func findByPost(post: Post) -> Bool
}
