//
//  DeviceDeletionAllDataServiceProtocol.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceDeletionAllDataServiceProtocol {
    func deleteAllData(entityName: String, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}
