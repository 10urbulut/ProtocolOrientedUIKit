//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Onur Bulut on 5.10.2023.
//

import Foundation


protocol UserViewModelOutput : AnyObject {
    
    func updateView(name: String, email: String, userName: String)
}
