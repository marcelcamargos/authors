//
//  PostModel.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

enum PostModel {

    //MARK: Request
    ///view -> interactor

    struct Request {

    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        var posts: [Post]
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        var items: [Post]
    }
}
