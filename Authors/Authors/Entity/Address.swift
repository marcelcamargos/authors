//
//  Address.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
