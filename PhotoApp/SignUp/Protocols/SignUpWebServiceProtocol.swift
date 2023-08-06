//
//  SignUpWebServiceProtocol.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation


protocol SignUpWebServiceProtocol {
    
    func SignUp(withForm SignUpModel:SignUpFormRequestModel , completionHandler:@escaping (SignUpResponseModel?, SignUpError?) -> Void)
}
