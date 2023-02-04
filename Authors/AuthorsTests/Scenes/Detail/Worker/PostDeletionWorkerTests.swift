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
    
    class PostDeletionServiceSpy: PostDeletionServiceDatasource {
        
        // MARK: Method call expectations
        
        var postDeletionCalled = false
        
        // MARK: Spied methods
        
        func processDeletion(postId: Int32, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
            postDeletionCalled = true
            success("ok")
        }
    }
    
    func testPostDeletionWorkerShouldReturnOk() {
        // Given
        let serviceSpy = PostDeletionServiceSpy()
        sut = PostDeletionWorker(serviceSpy)
        
        // When
        let expect = expectation(description: "Wait for deletion to return")
        
        var res: String = ""
        sut?.deletePost(postId: Seeds.Posts.post1.id, success: { result in
            res = result
            expect.fulfill()
        }, fail: { (response) in
            
        })
        waitForExpectations(timeout: 1.1)
        
        //Then
        XCTAssertEqual(res, "ok", "result should be ok")
    }
}
