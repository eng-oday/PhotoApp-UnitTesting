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
    var mockSignUpViewDelegate:MockSignUpViewDelegate!

    override func setUp() {
         signUpFormModel            = SignUpFormModel(firstName:"oday" , lastName:"Mohammed" ,email:"oday.mo@gmail.com",password:"123456" , repeatPassword:"123456")
         mockSignUpModelValidator   = MockSignUpModelValidator()
         mockSignUpWebService       = MockSignUpWebService()
        mockSignUpViewDelegate      = MockSignUpViewDelegate()
        sut                         = SignUpPresenter(signUpFormValidator:mockSignUpModelValidator,SignUpWebService:mockSignUpWebService , SignUpviewDelegate:mockSignUpViewDelegate)
    }
    
    override func tearDown() {
        signUpFormModel            = nil
        mockSignUpModelValidator   = nil
        mockSignUpWebService       = nil
        sut                        = nil
        mockSignUpViewDelegate     = nil
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
    
    func testSignUpPresenter_WhenSignUpOperationSuccessful_CallsSuccessOnViewDelegate(){
        //Arrange
        let myExpectation           = expectation(description: "Expected the SuccessfullySignUp() method to be called")
        mockSignUpViewDelegate.expectation = myExpectation
        mockSignUpWebService.testFailure = false
        //Act
        sut.processUserSignUp(formModel: signUpFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        // Assert
        
        XCTAssertEqual(mockSignUpViewDelegate.successfullySignUpCounter, 1 , "the successfullySignUp() method was called more than one time . ")
    }
    
    func testSignUpPresenter_WhenSignUpOperationFailed_CallsErrorHandlerOnViewDelegate(){
        //Arrange
        let myExpectation           = expectation(description: "Expected the ErrorHandler() method to be called")
        mockSignUpViewDelegate.expectation = myExpectation
        mockSignUpWebService.testFailure = true
        
        //Act
        sut.processUserSignUp(formModel: signUpFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        // Assert
        XCTAssertEqual(mockSignUpViewDelegate.successfullySignUpCounter, 0)
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCalled, true , "the ErrorHandler() method was not called and i expect be called. ")
        XCTAssertNotNil(mockSignUpViewDelegate.signUpError)
            
    }
}
