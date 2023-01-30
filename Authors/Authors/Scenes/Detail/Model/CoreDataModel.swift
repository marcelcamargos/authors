//
//  CoreDataModel.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import Foundation

enum CoreDataModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        let post: Post
        let favourite: Bool
    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let result: String
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let result: String
    }
}
