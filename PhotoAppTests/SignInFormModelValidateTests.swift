//
//  SignInFormModelValidateTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 31/07/2023.
//

import XCTest
@testable import PhotoApp
final class SignInFormModelValidateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignInFormModelValidateTests_FirsNameIsValid_ShouldReturnTrue(){
        
        //Arrange
        let sut = SignInFormModelValidate()
        // Act
        
        let isFirstNameValid = sut.IsValidFirstName("oday")
        //Assert
        XCTAssertTrue(isFirstNameValid,"i expect to get true but i get false so there is something not expected ")
    }

}
