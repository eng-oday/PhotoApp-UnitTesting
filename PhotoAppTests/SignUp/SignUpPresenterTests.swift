//
//  SignUpPresenterTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import XCTest
@testable import PhotoApp
final class SignUpPresenterTests: XCTestCase {


    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    
    func testSignUpPresenter_WhenInformationProvided_WillValidateEachProperty(){
        
        //ARRANGE
        let signUpFormModel = SignUpFormModel(firstName:"" , lastName:"Mohammed" ,email:"oday.mo@gmail.com",password:"123456" , repeatPassword:"123456")
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let sut = SignUpPresenter(signUpFormValidator:mockSignUpModelValidator)
        //ACT
        
        sut.processUserSignUp(formModel:signUpFormModel)
        
        //ASSERT
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidate)
        XCTAssertTrue(mockSignUpModelValidator.isValidLastNme)
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidate)
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidate)
        
    }
}
