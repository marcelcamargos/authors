//
//  CommentService.swift
//  Authors
//
//  Created by Marcel Camargos on 29/01/23.
//

import Foundation

class CommentService: CommentServiceDatasource {
    func getComments(postId: Int, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
        
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
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
        })
        task.resume()
    }
}
