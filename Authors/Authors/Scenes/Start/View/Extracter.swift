//
//  Extracter.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class Extracter {
    public static var shared = Extracter()
    
    private init() {}
    
    func extactToList(posts: [Post]) -> [String] {
        var innerPosts: [String] = []
        for post in posts {
            innerPosts.append(post.title)
        }
        return innerPosts
    }
}
