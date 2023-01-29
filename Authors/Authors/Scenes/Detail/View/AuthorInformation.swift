//
//  AuthorInformation.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation
 
class AuthorInformation {
    public static var shared = AuthorInformation()
    private init() {}
    
    func findAuthor(post: Post, users: [User]) -> User {
        let author = users.filter({ $0.id == post.userId })
        return author.first ?? User(id: -1,
                                    name: "",
                                    username: "",
                                    email: "",
                                    address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")),
                                    phone: "",
                                    website: "",
                                    company: Company(name: "", catchPhrase: "", bs: ""))
    }
}
