//
//  UserServiceDatasource.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

protocol UserServiceDatasource: AnyObject {
    func getDetail(success: @escaping ([User]) -> (), fail: @escaping (String) -> ())
}
