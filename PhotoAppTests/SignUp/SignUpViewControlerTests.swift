//
//  SignUpViewControlerTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 07/08/2023.
//

import XCTest
@testable import PhotoApp
final class SignUpViewControlerTests: XCTestCase {


    var storyBoard:UIStoryboard!
    var sut:SignUpViewController!
    override func setUp() {
         storyBoard  = UIStoryboard(name: "Main", bundle: nil)
         sut         = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        storyBoard  = nil
        sut         = nil
    }
    
    
    func testSignUpViewController_WhenCreated_ShouldHaveEmptyFields() throws{
        
        //Arrange
        // .. ON SETUP FUNCTION
        //Act
        
        //Assert
        // TO UNWRAP OUTLET AND GET ERROR WHEN IT BE NIL ,
        let firstNameTextField = try XCTUnwrap(sut?.firstNameTextField , "the first name outlet not connected to your vc ")
        let lastNameTextField = try XCTUnwrap(sut?.lastNameTextField , "the last name outlet not connected to your vc ")
        let emailTextField = try XCTUnwrap(sut?.emailTextField , "the email outlet not connected to your vc ")
        let passwordTextField = try XCTUnwrap(sut?.passwordTextField , "the password outlet not connected to your vc ")
        let RepeatPasswordTextField = try XCTUnwrap(sut?.repeatPasswordTextField , "the repeat password outlet not connected to your vc ")

        
        XCTAssertEqual(firstNameTextField.text, "", "the first name text field was not when the view cotroller initially loaded ")
        XCTAssertEqual(lastNameTextField.text, "","the last name text field was not when the view cotroller initially loaded ")
        XCTAssertEqual(emailTextField.text, "" , "the email text field was not when the view cotroller initially loaded ")
        XCTAssertEqual(passwordTextField.text, "" , "the password text field was not when the view cotroller initially loaded ")
        XCTAssertEqual(RepeatPasswordTextField.text, "" , "the repeat passsword text field was not when the view cotroller initially loaded ")
    }
    
    func testSignUpViewController_WhenCretaed_HasSignUpButtonAndAction() throws {
        
        let SignUpButton:UIButton   = try XCTUnwrap(sut.signUpButton ,"the SignUpButton outlet not connected to your vc ")
        
        let SignUpButtonAction      = try XCTUnwrap(SignUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside) , "signUp Button does not have any action assigned to it ")
        
        XCTAssertEqual(SignUpButtonAction.count, 1 ) // HERE WE CHECK FOR COUNT OF ACCTIONS ON ACTION ARRAY
        
        
        //HERE WE CHECK ABOUT SPECIFIC ACTION BY USE HIS NAME AND CHECK IT ON THE ARRAY OF BUTTON ACTIONS
        XCTAssertEqual(SignUpButtonAction.first , "SignUpButtonTapped:" , "signUp Button does not have any action called with SignUpButtonTapped assined to it .")
    }
    
    func testSignUpViewController_WhenSignUpButtonTapped_InvokeSignUpProcess(){
         //Arrange
        
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let mockSignUpWebService     = MockSignUpWebService()
        let mockSignUpViewDelegate   = MockSignUpViewDelegate()
        let mockUpSignUpPresenter = MockSignUpPresenter(signUpFormValidator: mockSignUpModelValidator, SignUpWebService: mockSignUpWebService, SignUpviewDelegate: mockSignUpViewDelegate)
        
        //Act
        sut.signUpPresenter = mockUpSignUpPresenter
        sut.signUpButton.sendActions(for: .touchUpInside)
        
        
        //Assert
        
        XCTAssertTrue(mockUpSignUpPresenter.ProcessSignUpCalled ,"the processUserSignUp() method was not called on a presenter object when ths signUp button was tapped on SignUpViewController " )
        
    }

}
