//
//  MockSignUpModelValidator.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation

@testable import PhotoApp
class MockSignUpModelValidator:SignUpModelValidatorProtocol {
    
    var isFirstNameValidate:Bool = false
    
    func IsValidFirstName(_ firstName: String) -> Bool {
        isFirstNameValidate = true
        return isFirstNameValidate
    }
    
    func isValidPassword(password: String) -> Bool {
        return true
    }
    
    func isValidLastNme(lastName: String) -> Bool {
        return true
    }
    
    func IsPasswordMatched(password: String, Repeated: String) -> Bool {
        return true
    }    
}
