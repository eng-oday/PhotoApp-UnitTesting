//
//  SignInFormModelValidateTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 31/07/2023.
//

import XCTest
@testable import PhotoApp

final class SignInFormModelValidateTests: XCTestCase {

    var sut: SignInFormModelValidate!
    
    override func setUp() {
        sut = SignInFormModelValidate()
    }

    override func tearDown() {
        sut = nil
    }

    func testSignInFormModelValidateTests_FirsNameIsValid_ShouldReturnTrue(){
        //Arrange
        // Act
        
        let isFirstNameValid = sut.IsValidFirstName("oday")
        //Assert
        XCTAssertTrue(isFirstNameValid,"i expect to get true but i get false so there is something not expected ")
    }
    
    func testSignInFormModelValidateTests_FirstNameIsVeryShort_ShouldReturnFalse(){
        //Arrange
        //Act
        
        let isFirstNameVeryShort = sut.IsValidFirstName("mo")
        
        // Assert
        XCTAssertFalse(isFirstNameVeryShort,"i expect to get invalid first name because it's short and i pass it as short text name , but i got it as valid .")
    }

}
