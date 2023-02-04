//
//  DetailService.swift
//  Authors
//
//  Created by Marcel Camargos on 28/01/23.
//

import Foundation

class UserService: UserServiceDatasource {
    private var session: URLSessionProtocol

    init(withSession session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getDetail(success: @escaping ([User]) -> (), fail: @escaping (String) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        guard let url = url else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
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
               let users = try? JSONDecoder().decode([User].self, from: data) {
                DispatchQueue.main.async {
                    success(users)
                }
            }
        }
        
        task.resume()
    }
}
