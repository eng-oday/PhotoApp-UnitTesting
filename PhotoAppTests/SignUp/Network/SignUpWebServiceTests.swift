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
        XCTAssertEqual(error, SignUpError.invalidResponseModel , "the signUp() method did not return expcted error")
        expectaion.fulfill()
    }
    
    self.wait(for: [expectaion], timeout: 5)
        
    }
    
    
    func testSignUpWebService_WhenEmptyRequestUrlProvided_ShouldReturnError(){
        //Arrange
        sut = SignUpWebService(urlString: "")
        let expectaion  = self.expectation(description: "An Empty Url Request Expectaion")
        
        //Act
        sut.SignUp(withForm: signUpFormRequestModel) { signUpResponse, error in
            
            //Assert
            XCTAssertEqual(error, SignUpError.invalidUrlRequestString," expect from SignUp() return error invalid url but she don't and return a different one")
            XCTAssertNil(signUpResponse,"expext from SignUp() to get nil response but i got a result")
            expectaion.fulfill()
        }
        
        self.wait(for: [expectaion], timeout: 2)
    }
    
    
    func testSignUpWebService_WhenRequestFail_shouldReturnErrorMessageDescription(){
        
        //Arrange
        let expectation         = self.expectation(description: "excpect return localized error message because reauest is failed")
        let errorDescription    = "Localized Description Of An Error"
        MockUrlProtocol.error   = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        
        // Act
        sut.SignUp(withForm: signUpFormRequestModel) { responseModel, error in
            //Assert
            XCTAssertEqual(error, SignUpError.failedRequest(description:errorDescription),"excpect from SignUp() return failedRequest error message because request is failed but it return different error")
            expectation.fulfill()
        }
        
       
        self.wait(for: [expectation], timeout: 2)
        
    }
    
}
