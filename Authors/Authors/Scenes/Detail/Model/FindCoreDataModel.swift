//
//  FindCoreDataModel.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import Foundation

enum FindCoreDataModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        let post: Post
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
