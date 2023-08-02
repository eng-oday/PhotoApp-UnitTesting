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
        let config = URLSessionConfiguration.ephemeral                          // 1.  CREATE CONFIG WITHOUT ANY PERSISTANCE STORAGE (CASHE- COOKIE - CREDENTIALS) AND THAT WHAT EPHEMERAL MEAN
        config.protocolClasses              = [MockUrlProtocol.self]            // 1.1 ADD OUR MOCK PROTOCOL
        let jsonString                      = "{\"status\":\"ok\"}"             // 1.2 WRITE THE RESPONSE MODEL WE WAIT FROM SUCCESS CASE
        MockUrlProtocol.stubResponseData    =  jsonString.data(using: .utf8)    // 1.3 CONVERT JSON STRING TO DATA TYPE AND INJECT IT TO MOCK URL PROTOCOL
        let urlSession = URLSession(configuration: config)                      // 2.  CREATE URL SESSION WITH OUR CUSTOM CONFIG
        
        // 1. CREATE SYSTEM UNDER TEST
        let sut = SignUpWebService(urlString:SignUpConstants.signUpUrlString ,urlSession: urlSession)
        
        // 2. CREATE OBJECT FROM REQUEST MODEL WITH FAKE DATA
        let signUpFormRequestModel = SignUpFormRequestModel(firstName:"oday",lastName:"mohammed",email:"oday@gmail.com",password:"123456")
        
        let expectaion              =  self.expectation(description: "SignUp Web Service Response Expectasion .")
        // MARK:  Act
        
        //3. CALL FUNCTION BY SYSTEM UNDER TEST
        sut.SignUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in
            
            // FOR EXAMPLE THE MODEL BECOME - >  {/"Status"/:/"Ok"/}
            
            // MARK:  Assert
            // 4. CHECK IF THE RESPONSE STATUS IS BECOME SUCCESFULLY
            XCTAssertEqual(SignUpResponseModel?.status, "ok")
            expectaion.fulfill()
            
        }
        
        self.wait(for: [expectaion], timeout: 5)
        
        
    }
    
}
