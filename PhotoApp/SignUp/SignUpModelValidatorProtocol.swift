//
//  SignUpModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation


protocol SignUpModelValidatorProtocol {
    
    func IsValidFirstName (_ firstName:String) -> Bool
    func isValidPassword(password:String)-> Bool
    func isValidLastNme(lastName: String)  -> Bool
    func IsPasswordMatched(password:String,Repeated:String) -> Bool
}
