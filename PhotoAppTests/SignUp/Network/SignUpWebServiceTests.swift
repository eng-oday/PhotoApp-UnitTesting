//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 01/08/2023.
//

import XCTest
@testable import PhotoApp
final class SignUpWebServiceTests: XCTestCase {
    
    var sut:SignUpWebService!
    var signUpFormRequestModel:SignUpFormRequestModel!
    
    override func setUp() {
        
        let config = URLSessionConfiguration.ephemeral                          // CREATE CONFIG WITHOUT ANY PERSISTANCE STORAGE (CASHE- COOKIE - CREDENTIALS) AND THAT WHAT EPHEMERAL MEAN
        config.protocolClasses              = [MockUrlProtocol.self]            // ADD OUR MOCK PROTOCOL
        let urlSession = URLSession(configuration: config)                      //  CREATE URL SESSION WITH OUR CUSTOM CONFIG
        
         sut = SignUpWebService(urlString:SignUpConstants.signUpUrlString ,urlSession: urlSession)
        
         signUpFormRequestModel = SignUpFormRequestModel(firstName:"oday",lastName:"mohammed",email:"oday@gmail.com",password:"123456")
    }

    override func tearDown() {
        sut = nil
        signUpFormRequestModel = nil
        MockUrlProtocol.stubResponseData = nil
    }
    
    func testSignUpWebService_WhenGivenSuccesfullyResponse_ShouldReturnSuccess(){
        
        // MARK:  Arrange
        let jsonString                      = "{\"status\":\"ok\"}"             // WRITE THE RESPONSE MODEL WE WAIT FROM SUCCESS CASE
        MockUrlProtocol.stubResponseData    =  jsonString.data(using: .utf8)    // CONVERT JSON STRING TO DATA TYPE AND INJECT IT TO MOCK URL PROTOCOL
        let expectaion              =  self.expectation(description: "SignUp Web Service Response Expectasion .")
        
        // MARK:  Act
        
        // CALL FUNCTION BY SYSTEM UNDER TEST
        sut.SignUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in

            // MARK:  Assert
            //  CHECK IF THE RESPONSE STATUS IS BECOME SUCCESFULLY
            XCTAssertEqual(SignUpResponseModel?.status, "ok")
            expectaion.fulfill()
            
        }
        
        self.wait(for: [expectaion], timeout: 5)
    }
    
    
    func testSignUpWebService_WhenRecieveDifferentJsonResponse_ShouldBeGotError(){
        
        // MARK:  Arrange
        let jsonString                      = "{\"alert\":\"differenet result\"}"
        MockUrlProtocol.stubResponseData    =  jsonString.data(using: .utf8)

        let expectaion                      =  self.expectation(description: "SignUp() method expectation is got different Json Response")
        
    // MARK:  Act
    sut.SignUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in

        // MARK: ASSERT
        XCTAssertNil(SignUpResponseModel , "SignUp() must send Response as nil when i got Different Json Response but i got a value")
        XCTAssertEqual(error, SignUpError.ResponseModelParsingError , "the signUp() method did not return expcted error")
        expectaion.fulfill()
        
    }
    
    self.wait(for: [expectaion], timeout: 5)
        
    }
    
    
}
