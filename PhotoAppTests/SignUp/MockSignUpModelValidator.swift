//
//  MockSignUpModelValidator.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation

@testable import PhotoApp
class MockSignUpModelValidator:SignUpModelValidatorProtocol {
    
    var isFirstNameValidate:Bool        = false
    var isValidPassword:Bool            = false
    var isValidLastNme:Bool             = false
    var IsPasswordMatched:Bool          = false
    
    func IsValidFirstName(_ firstName: String) -> Bool {
        isFirstNameValidate = true
        return isFirstNameValidate
    }
    
    func isValidPassword(password: String) -> Bool {
        isValidPassword = true
        return isValidPassword
    }
    
    func isValidLastNme(lastName: String) -> Bool {
        isValidLastNme = true
        return isValidLastNme
    }
    
    func IsPasswordMatched(password: String, Repeated: String) -> Bool {
        IsPasswordMatched = true
        return IsPasswordMatched
    }    
}
