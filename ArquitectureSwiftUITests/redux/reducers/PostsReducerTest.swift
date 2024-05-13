//
//  PostsReducerTest.swift
//  ArquitectureSwiftUITests
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import XCTest
@testable import ArquitectureSwiftUI

final class PostsReducerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRetrievePostsSuccessfully() throws {
       
        let post = Post(uid:"123", message: "Lorem Ipsum")
        let posts = [post]
        let state = AppState()
        let action = PostsAction(list: posts)
        let newState = postsReducer(action: action, state: state)
        
        XCTAssertEqual(posts, newState.posts.list, "the list is same")
        XCTAssertEqual(false, newState.posts.isLoading, "isLoading false")

    }
    
    func testRetrieveAndLoadTrue() throws {
        
        let state = AppState()
        let action = FetchAction()
        let newState = postsReducer(action: action, state: state)
        XCTAssertEqual(true, newState.posts.isLoading, "isLoading true")
     
    }

}
