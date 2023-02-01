//
//  Matcher.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

protocol MatcherDelegate: AnyObject {
    func match(post: Post, favourites: [Post]) -> Bool
}

class Matcher: MatcherDelegate {
    public static var shared = Matcher()
    private init() {}
    func match(post: Post, favourites: [Post]) -> Bool {
        for pst in favourites {
            if pst.id == post.id {
                return true
            }
        }
        return false
    }
}
