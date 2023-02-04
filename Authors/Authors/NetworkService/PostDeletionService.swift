//
//  PostDeletionService.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class PostDeletionService: PostDeletionServiceDatasource {
    private var session: URLSessionProtocol

    init(withSession session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func processDeletion(postId: Int32, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                fail("Error with post deletion: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                fail("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            DispatchQueue.main.async {
                success("ok")
            }
        }
        
        task.resume()
    }
}
