//
//  Post.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
