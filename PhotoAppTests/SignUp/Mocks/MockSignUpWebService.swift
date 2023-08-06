//
//  MockSignUpWebService.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation

@testable import PhotoApp
class MockSignUpWebService:SignUpWebServiceProtocol {
    
    var isSignUpMethodCalled:Bool = false
    
    func SignUp(withForm SignUpModel: SignUpFormRequestModel, completionHandler: @escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        isSignUpMethodCalled =  true
    }
}
