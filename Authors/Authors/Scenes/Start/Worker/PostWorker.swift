//
//  PostWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

class PostWorker1: PostWorkerDelegate1 {
    
    func getItemsList(success: @escaping ([String]) -> (), fail:@escaping (String) -> ()) {
        let service = PostItemsService()
        
        service.getSimpleListOfItems { (items) in
            success(items)
            
        } fail: { (message) in
            fail(message)
        }
    }
}
