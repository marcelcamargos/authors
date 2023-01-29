//
//  User.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
