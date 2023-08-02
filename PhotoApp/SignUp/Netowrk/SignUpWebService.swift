//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 01/08/2023.
//

import Foundation
import UIKit

class SignUpWebService {
    
    private var urlSession:URLSession
    private var urlString:String
    
    init(urlString: String,urlSession:URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func SignUp(withForm SignUpModel:SignUpFormRequestModel , completionHandler:@escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        
        // 1. SEETUP URL
        guard let url = URL(string: urlString) else {
            // TODO : make unit test to test that specific error message is returned is url is nil
            return
        }
        // 2. PREPARE URL REQUEST
        var urlRequest          = URLRequest(url: url)
        urlRequest.httpMethod   = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody  = try? JSONEncoder().encode(SignUpModel)
        
        // 3. CREATE DATA TASK
        let dataTask        =  urlSession.dataTask(with: urlRequest) { data, response, error in
            
            // TODO : WRITE UNIT TEST TO HANDLE ERROR
            
            if let data = data , let responseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data){
                print(responseModel)
                return completionHandler(responseModel, nil)
            }else {
                completionHandler(nil,SignUpError.ResponseModelParsingError)
            }
        }
        dataTask.resume()
    }
}
