//
//  PostItemsService.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

protocol PostServiceDatasource: AnyObject {
    func getSimpleListOfItems(success: @escaping([Post]) -> (), fail: @escaping(_ message: String) -> ())
}

class PostService: PostServiceDatasource {
    private var posts: [Post]?
    
    func getSimpleListOfItems(success: @escaping ([Post]) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                fail("Error with fetching posts: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                fail("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let posts = try? JSONDecoder().decode([Post].self, from: data) {
                DispatchQueue.main.async {
                    success(posts)
                }
            }
        })
        task.resume()
    }
}
