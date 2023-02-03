//
//  Post.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

struct Post: Codable, Equatable {
    let userId: Int32
    let id: Int32
    let title: String
    let body: String
}
