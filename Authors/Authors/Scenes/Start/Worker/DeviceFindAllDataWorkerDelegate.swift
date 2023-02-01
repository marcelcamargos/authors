//
//  DeviceFindAllDataWorkerDelegate.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

protocol DeviceFindAllDataWorkerDelegate: AnyObject {
    func findFavourites(entityName: String, success: @escaping ([Post]) -> (), fail: @escaping (String) -> ())
}
