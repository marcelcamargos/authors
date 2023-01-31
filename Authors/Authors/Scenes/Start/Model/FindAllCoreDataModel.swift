//
//  FindAllCoreDataModel.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import Foundation

enum FindAllCoreDataModel {

    //MARK: Request
    ///view -> interactor

    struct Request {
        
    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let wishes: [Post]
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let result: [Post]
    }
}
