//
//  CommentCoreDataModel.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

enum CommentCoreDataModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        let comments: [Comment]
    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let result: Bool
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let result: Bool
    }
}
