//
//  Organizer.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

protocol OrganizerDelegate: AnyObject {
    func organize(posts: inout [Post], favourites: [Post])
}

class Organizer: OrganizerDelegate {
    public static var shared = Organizer()
    private init() {}
    func organize(posts: inout [Post], favourites: [Post]) {
        for favourite in favourites {
            if posts.contains(favourite) {
                if let index = posts.firstIndex(of: favourite) {
                    posts.remove(at: index)
                }
            }
        }
        posts = favourites + posts
    }
}
