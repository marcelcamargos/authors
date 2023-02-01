//
//  PostWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

class PostWorker: PostWorkerDelegate {
    
    func getPostList(success: @escaping ([Post]) -> (), fail:@escaping (String) -> ()) {
        let service = PostService()
        
        service.getPosts { (items) in
            success(items)
            
        } fail: { (message) in
            fail(message)
        }
    }
}
