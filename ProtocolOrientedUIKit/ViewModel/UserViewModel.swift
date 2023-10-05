//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Onur Bulut on 5.10.2023.
//

import Foundation
class UserViewModel {
    private let userService : UserService
    
    weak var output : UserViewModelOutput?
    
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers () {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case .failure:
                self?.output?.updateView(name: "No User", email: "", userName: "")
            }
        }
    }
    
    
}
