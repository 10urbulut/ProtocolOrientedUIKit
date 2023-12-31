//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Onur Bulut on 5.10.2023.
//

import Foundation


protocol UserService{
    func fetchUser (completion : @escaping(Result<User,Error>) -> Void)
}
