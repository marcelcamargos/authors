//
//  DeviceFindAllDataServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceFindAllDataServiceDatasource {
    func findFavourites(entityName: String, success: @escaping ([Post]) -> (), fail: @escaping (String) -> ())
}
