//
//  PostThunksTest.swift
//  ArquitectureSwiftUITests
//
//  Created by Jorge Acosta Alvarado on 13-05-24.
//

import XCTest
import SwiftMock
import ReSwift
import ReSwiftThunk
@testable import ArquitectureSwiftUI

final class PostThunksTest: XCTestCase {

    private let useCaseMock = MockRetrievePostsUseCaseProtocol.create()
    
    
    private func verify(file: StaticString = #file,
                        line: UInt = #line) {
        useCaseMock.verify(file: file, line: line)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchThunk() async throws {
        
        let getState: () -> AppState = { fatalError("getState should not be called in this test") }
        let middleware: Middleware<AppState> = createThunkMiddleware()
        let postThunks = PostThunks(useCase: useCaseMock)
        
   
        var dispatchedAction: Action?
        let dispatchExpectation = expectation(description: "Dispatch")
        
        let dispatch: DispatchFunction = { action in
            dispatchedAction = action
            dispatchExpectation.fulfill()
        }
        let next: DispatchFunction = { action in
            print("dispatchedAction", action)
        }
       
        let thunk = postThunks.fetchThunk()
        
        middleware(dispatch, getState)(next)(thunk)
        
       
        await waitForExpectations(timeout: 5) { error in
           XCTAssertNotNil(dispatchedAction)
           XCTAssertTrue(dispatchedAction is PostsAction<Post>)
        }

    }

   

}

class MockRetrievePostsUseCaseProtocol: Mock<RetrievePostsUseCaseProtocol>, RetrievePostsUseCaseProtocol {
    func fetchAsyncData() async throws -> [Post] {
        return []
    }
}

