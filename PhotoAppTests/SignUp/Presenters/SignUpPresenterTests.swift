//
//  SignUpPresenterTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import XCTest
@testable import PhotoApp
final class SignUpPresenterTests: XCTestCase {
    var sut:SignUpPresenter!
    var signUpFormModel:SignUpFormModel!
    var mockSignUpModelValidator:MockSignUpModelValidator!
    var mockSignUpWebService:MockSignUpWebService!

    override func setUp() {
         signUpFormModel            = SignUpFormModel(firstName:"oday" , lastName:"Mohammed" ,email:"oday.mo@gmail.com",password:"123456" , repeatPassword:"123456")
         mockSignUpModelValidator   = MockSignUpModelValidator()
         mockSignUpWebService       = MockSignUpWebService()
         sut                        = SignUpPresenter(signUpFormValidator:mockSignUpModelValidator,SignUpWebService:mockSignUpWebService)
    }
    
    override func tearDown() {
        signUpFormModel            = nil
        mockSignUpModelValidator   = nil
        mockSignUpWebService       = nil
        sut                        = nil
    }
    
    
    func testSignUpPresenter_WhenInformationProvided_WillValidateEachProperty(){
        
        //ARRANGE

        //ACT
        
        sut.processUserSignUp(formModel:signUpFormModel)
        
        //ASSERT
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidate, "first name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidLastNme, "last name wase not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidPassword , "passwrod is not validated")
        XCTAssertTrue(mockSignUpModelValidator.IsPasswordMatched , "password is not matched")
        
    }
    
    func testSignUpPresenter_WhenGivenValidFormModel_ShouldCallSignUpMethod(){
        
        //ARRANGE

        //ACT
        sut.processUserSignUp(formModel:signUpFormModel)
        //ASSERT
        
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled , "the SignUp()method was not called in SignUpWebService class ")
    }
}
