//
//  CommentService.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class CommentService: CommentServiceDatasource {
    private var session: URLSessionProtocol

    init(withSession session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getComments(postId: Int32, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
        
        guard let url = url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                fail("Error with fetching comments: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                fail("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let comments = try? JSONDecoder().decode([Comment].self, from: data) {
                DispatchQueue.main.async {
                    success(comments)
                }
            }
        }
        
        task.resume()
    }
}
