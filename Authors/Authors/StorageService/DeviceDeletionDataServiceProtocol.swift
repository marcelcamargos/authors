//
//  DeviceDeletionDataServiceProtocol.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceDeletionDataServiceProtocol {
    func deleteData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
