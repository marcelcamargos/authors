//
//  PostDeletionWorkerTests.swift
//  AuthorsTests
//
//  Created by Marcel Camargos on 04/02/23.
//

import XCTest
@testable import Authors

final class PostDeletionWorkerTests: XCTestCase {
    // MARK: - System under test
    
    var sut: PostDeletionWorkerDelegate?
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let postDeletionProtocol: PostDeletionServiceDatasource = PostDeletionService()
        sut = PostDeletionWorker(postDeletionProtocol)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    class PostDeletionServiceSpy: PostDeletionServiceDatasource {
        
        // MARK: Method call expectations
        
        var postDeletionCalled = false
        
        // MARK: Argument expectations

        var testPostId: Int32 = Seeds.Posts.post1.id
        
        // MARK: Spied methods
        
        func processDeletion(postId: Int32, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
            postDeletionCalled = true
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
//                if username.isEmpty, password.isEmpty {
//                    fail("login error empty")
//                } else {
//                    success(self.testUserFirstName, self.testUserLastName, self.testUserGenre)
//                }
//            }
        }
    }

}
