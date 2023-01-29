//
//  DetailModel.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

enum DetailModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        
    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let users: [User]
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let users: [User]
    }
}
