//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Onur Bulut on 5.10.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var userViewModelSut : UserViewModel!
    private var userServiceSut :MockUserService!
    private var output : MockUserViewModelOutput!
    

    override func setUpWithError() throws {
        userServiceSut = MockUserService()
        userViewModelSut = UserViewModel(userService: userServiceSut)
        output = MockUserViewModelOutput()
        userViewModelSut.output = output
    }

    override func tearDownWithError() throws {
        
        userServiceSut = nil
        userViewModelSut = nil
        
    }

    func testUpdateView_whenAPISucess_ShowsEmailNameUserName() throws {
      
        let mockUser = User(id: 1, name: "Onur", username: "onurbulut", email: "onur.mail", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        userServiceSut.fetchUSerMockResult = .success(mockUser)
        
        userViewModelSut.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "onurbulut")
        
    }
    
    func testUpdateView_whenAPIFailiure_ShowsNoUser() throws {
        userServiceSut.fetchUSerMockResult = .failure(NSError())
        
        userViewModelSut.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.name , "No User")
        
        
    }

}
class MockUserService: UserService {
    var fetchUSerMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUSerMockResult {
            completion(result)
        }
    }
    
    
}

class MockUserViewModelOutput : UserViewModelOutput {
    
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name, email, userName))
        
    }
    
    
}
