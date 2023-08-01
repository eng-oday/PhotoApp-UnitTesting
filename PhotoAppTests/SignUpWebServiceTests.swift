//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 01/08/2023.
//

import XCTest
@testable import PhotoApp
final class SignUpWebServiceTests: XCTestCase {


    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testSignUpWebService_WhenGivenSuccfullyResponse_ShouldReturnSuccess(){
        
        //Arrange
        
        // 1. CREATE SYSTEM UNDER TEST
        let sut = SignUpWebService()
        
        // 2. CREATE OBJECT FROM REQUEST MODEL WITH FAKE DATA
        let signUpFormRequestModel = SignUpFormRequestModel(firstName:"oday",lastName:"mohammed",email:"oday@gmail.com",password:"123456")
        
        //Act
        
        //3. CALL FUNCTION BY SYSTEM UNDER TEST
        sut.SignUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in 
            
        }
        
        //Assert
    }
    
}
