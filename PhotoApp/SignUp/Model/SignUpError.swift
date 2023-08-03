//
//  SignUpError.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 01/08/2023.
//

import Foundation


enum SignUpError:LocalizedError,Equatable {
    
    case invalidResponseModel
    case invalidUrlRequestString
    case failedRequest(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(description: let description):
            return description
        case .invalidResponseModel , .invalidUrlRequestString :
            return ""
        }
    }
}
