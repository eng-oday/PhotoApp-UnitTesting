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
    
    func successfullySignUp() {
        expectation?.fulfill()
    }
    
    func errorHandler(Error: PhotoApp.SignUpError) {
        // TODO
    }
}
