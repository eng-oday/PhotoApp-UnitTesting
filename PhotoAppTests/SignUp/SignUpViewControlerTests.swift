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

}
