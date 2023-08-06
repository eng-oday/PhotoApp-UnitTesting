//
//  MockSignUpViewDelegate.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignUpViewDelegate:SignUpViewDelegateProtocol {

    var expectation:XCTestExpectation?
    var successfullySignUpCounter:Int = 0
    var errorHandlerCalled:Bool = false
    var signUpError:Error? 
    
    func successfullySignUp() {
        successfullySignUpCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(Error: SignUpError) {
        signUpError = Error
        errorHandlerCalled = true
        expectation?.fulfill()
    }
}
