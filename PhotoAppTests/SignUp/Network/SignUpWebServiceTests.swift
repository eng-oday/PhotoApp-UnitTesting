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
    
    func testSignUpWebService_WhenGivenSuccesfullyResponse_ShouldReturnSuccess(){
        
            // MARK:  Arrange
        
        // 1. CREATE SYSTEM UNDER TEST
        let sut = SignUpWebService(urlString:"https://bit.ly/signup-mock-service-users")
        
        // 2. CREATE OBJECT FROM REQUEST MODEL WITH FAKE DATA
        let signUpFormRequestModel = SignUpFormRequestModel(firstName:"oday",lastName:"mohammed",email:"oday@gmail.com",password:"123456")
        
        let expectaion              =  self.expectation(description: "SignUp Web Service Response Expectasion .")
        // MARK:  Act
        
        //3. CALL FUNCTION BY SYSTEM UNDER TEST
        sut.SignUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in
            
            // FOR EXAMPLE THE MODEL BECOME - >  {/"Status"/:/"Ok"/}
            
            // MARK:  Assert
            // 4. CHECK IF THE RESPONSE STATUS IS BECOME SUCCESFULLY
            XCTAssertEqual(SignUpResponseModel?.Status, "Ok")
            expectaion.fulfill()
            
        }
        
        self.wait(for: [expectaion], timeout: 5)
        
        
    }
    
}
