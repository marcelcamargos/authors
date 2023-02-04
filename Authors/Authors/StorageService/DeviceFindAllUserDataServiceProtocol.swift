//
//  DeviceFindAllUserDataServiceProtocol.swift
//  Authors
//
//  Created by Marcel Camargos on 04/02/23.
//

import Foundation

protocol DeviceFindAllUserDataServiceProtocol {
    func findAllUserData(success: @escaping ([User]) -> (), fail: @escaping (String) -> ())
}
