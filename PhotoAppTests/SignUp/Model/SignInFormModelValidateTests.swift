//
//  SignInFormModelValidateTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 31/07/2023.
//

import XCTest
@testable import PhotoApp

final class SignInFormModelValidateTests: XCTestCase {

    var sut: SignUpFormModelValidate!
    
    override func setUp() {
        sut = SignUpFormModelValidate()
    }

    override func tearDown() {
        sut = nil
    }

    func testSignUpFormModelValidateTests_FirsNameIsValid_ShouldReturnTrue(){
        //Arrange
        // Act
        
        let isFirstNameValid = sut.IsValidFirstName("oday")
        //Assert
        XCTAssertTrue(isFirstNameValid,"the IsValidFirstName() should return true if first name is valid but it's return false")
    }
    
    func testSignUpFormModelValidateTests_FirstNameIsVeryShort_ShouldReturnFalse(){
        //Arrange
        //Act
        
        let isFirstNameVeryShort = sut.IsValidFirstName("mo")
        
        // Assert
        XCTAssertFalse(isFirstNameVeryShort,"the IsValidFirstName() should return false if first name is less than (\(SignUpConstants.firstNameMinLength) char but it return true ")
    }
    
    func testSignUpFormModelTests_FirstNameIsTooLong_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isShortFirstName = sut.IsValidFirstName("odayMohammedAbdelsalam")
        
        XCTAssertFalse(isShortFirstName,"the IsValidFirstName() should return false if first name is too long and greater than (\(SignUpConstants.firstNameMaxLength) char but it return true ")
    }
    
    func testSignUpFormModelTests_PasswordIsValid_ShouldReturnTrue(){
        //Arrange
        //Act
        let isValidPassword = sut.isValidPassword(password: "odayMohammed")
        // Assert
        XCTAssertTrue(isValidPassword,"the isValidPassword() should return true if password i passed is greater than (\(SignUpConstants.minPasswordLength)) char but it return false ")
        
    }
    
    func testSignUpFormModelTests_PasswordIsTooShort_ShouldReturnFalse(){
        //Arrange
        //Act
        let isValidPassword = sut.isValidPassword(password: "oday")
        // Assert
        XCTAssertFalse(isValidPassword,"the isValidPassword() should return false if password i passed is less than (\(SignUpConstants.minPasswordLength)) char but it return true ")
        
    }
    
    func testSignUpFormModelTests_lastNameIsValid_ShouldReturnTrue(){
        //Arrange
        
        //Act
        let isValidLastName = sut.isValidLastNme(lastName: "oday")
        //Assert
        XCTAssertTrue(isValidLastName, "the isValidLastNme() should return true if last name is valid  but it return false ")
    }
    
    func testSignUpFormModelTests_lastNameIstooShort_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isValidLastName = sut.isValidLastNme(lastName: "od")
        //ASsert
        XCTAssertFalse(isValidLastName, "the isValidLastNme() should return false if password i passed is less than (\(SignUpConstants.minPasswordLength)) char but it return true ")
    }
    
    func testSignUpFormModelTests_lastNameIstooLong_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isValidLastName = sut.isValidLastNme(lastName: "odymojdhjdshjnfjshfjhsfnbfsjbsafgjhgfjhagshfbsnbhsfghgfddbfdkfhjkd")
        //ASsert
        XCTAssertFalse(isValidLastName, "the isValidLastNme() should return false if password i passed is less than (\(SignUpConstants.firstNameMaxLength)) char but it return true ")
    }
    
    func testSignUpFormModelTests_passwordIsMatched_ShouldReturnTrue() {
        
        //Arrange
        
        //Act
        let IsMatched = sut.IsPasswordMatched(password:"123456",Repeated:"123456")
        
        //Assert
        
        XCTAssertTrue(IsMatched, "the IsPasswordMatched() should return true if password match but it return false ")
        
    }
    
    func testSignUpFormModelTests_passwordIsNotMatched_ShouldReturnFalse() {
        
        //Arrange
        
        //Act
        let IsMatched = sut.IsPasswordMatched(password:"123456",Repeated:"1234")
        
        //Assert
        
        XCTAssertFalse(IsMatched, "the IsPasswordMatched() should return false if password not match but it return true ")
        
    }

}
