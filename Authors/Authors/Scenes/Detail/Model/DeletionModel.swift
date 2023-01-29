//
//  DeletionModel.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

enum DeletionModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        let post: Post
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
