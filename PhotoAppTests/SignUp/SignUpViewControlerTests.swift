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
    
    
    func testSignUpViewController_WhenCreated_ShouldHaveEmptyFields(){
        
        //Arrange
        // .. ON SETUP FUNCTION
        //Act
        
        //Assert
        XCTAssertEqual(sut?.firstNameTextField.text, "")
        XCTAssertEqual(sut?.lastNameTextField.text, "")
        XCTAssertEqual(sut?.emailTextField.text, "")
        XCTAssertEqual(sut?.passwordTextField.text, "")
        XCTAssertEqual(sut?.repeatPasswordTextField.text, "")
    }

}
