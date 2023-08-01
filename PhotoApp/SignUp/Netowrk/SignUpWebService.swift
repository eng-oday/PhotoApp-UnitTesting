//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 01/08/2023.
//

import Foundation


class SignUpWebService {
    
    private var urlString:String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func SignUp(withForm SignUpModel:SignUpFormRequestModel , completionHandler:@escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        
    }
}
