//
//  Comment.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
