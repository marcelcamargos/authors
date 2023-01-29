//
//  User.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

struct User: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: Address?
    let phone: String?
    let website: String?
    let company: Company?
    
    init(id: Int,
         name: String,
         username: String,
         email: String,
         address: Address,
         phone: String,
         website: String,
         company: Company) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}
