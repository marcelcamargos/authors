//
//  PostWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

class PostWorker: PostWorkerDelegate {
    
    // MARK: - Private Properties

    private var service: PostServiceDatasource
    
    // MARK: - Init

    init(_ service: PostServiceDatasource = PostService()) {
        self.service = service
    }
    
    func getPostList(success: @escaping ([Post]) -> (), fail:@escaping (String) -> ()) {
        service.getPosts { (items) in
            success(items)
            
        } fail: { (message) in
            fail(message)
        }
    }
}
