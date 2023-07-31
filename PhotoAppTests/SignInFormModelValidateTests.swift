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
        XCTAssertTrue(isFirstNameValid,"the IsValidFirstName() should return true if first name is valid but it's return false")
    }
    
    func testSignInFormModelValidateTests_FirstNameIsVeryShort_ShouldReturnFalse(){
        //Arrange
        //Act
        
        let isFirstNameVeryShort = sut.IsValidFirstName("mo")
        
        // Assert
        XCTAssertFalse(isFirstNameVeryShort,"the IsValidFirstName() should return false if first name is less than (\(SignUpConstants.firstNameMinLength) char but it return true ")
    }
    
    func testSignInFormModelTests_FirstNameIsTooLong_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isShortFirstName = sut.IsValidFirstName("odayMohammedAbdelsalam")
        
        XCTAssertFalse(isShortFirstName,"the IsValidFirstName() should return false if first name is too long and greater than (\(SignUpConstants.firstNameMaxLength) char but it return true ")
    }

}
