//
//  PostItemsService.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostItemsServiceDatasource: AnyObject {
    func getSimpleListOfItems(success: @escaping([Post]) -> (), fail: @escaping(_ message: String) -> ())
}

class PostItemsService: PostItemsServiceDatasource {
    func getSimpleListOfItems(success: @escaping ([Post]) -> (), fail: @escaping (String) -> ()) {
        let posts = [Post(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
                     Post(userId: 2, id: 2, title: "et ea vero quia laudantium autem", body: "delectus reiciendis molestiae occaecati non minima eveniet qui voluptatibus\naccusamus in eum beatae sit\nvel qui neque voluptates ut commodi qui incidunt\nut animi commodi"),
                     Post(userId: 3, id: 2, title: "asperiores ea ipsam voluptatibus modi minima quia sint", body: "veritatis unde neque eligendi\nquae quod architecto quo neque vitae\nest illo sit tempora doloremque fugit quod\net et vel beatae sequi ullam sed tenetur perspiciatis")]
        success(posts)
    }
}
