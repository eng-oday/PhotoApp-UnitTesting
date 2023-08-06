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
        let signUpFormModel = SignUpFormModel(firstName:"oday" , lastName:"Mohammed" ,email:"oday.mo@gmail.com",password:"123456" , repeatPassword:"123456")
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let mockSignUpWebService    = MockSignUpWebService()
        let sut = SignUpPresenter(signUpFormValidator:mockSignUpModelValidator,SignUpWebService:mockSignUpWebService)
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
        let signUpFormModel = SignUpFormModel(firstName:"oday" , lastName:"Mohammed" ,email:"oday.mo@gmail.com",password:"123456" , repeatPassword:"123456")
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let mockSignUpWebService    = MockSignUpWebService()
        let sut = SignUpPresenter(signUpFormValidator:mockSignUpModelValidator,SignUpWebService:mockSignUpWebService)
        //ACT
        sut.processUserSignUp(formModel:signUpFormModel)
        //ASSERT
        
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled , "the SignUp()method was not called in SignUpWebService class ")
    }
}
