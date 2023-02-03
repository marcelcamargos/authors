//
//  CommentAllService.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import Foundation

class CommentAllService: CommentAllServiceDatasource {
    
    func getAllComments(success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")
        
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                fail("Error with fetching users: \(error)")
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
