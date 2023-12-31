//
//  SignInFormModelValidate.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 31/07/2023.
//

import Foundation


class SignUpFormModelValidate:SignUpModelValidatorProtocol {
    
    
    func IsValidFirstName (_ firstName:String)-> Bool {
        var isValid = true
        
        if firstName.count <= SignUpConstants.firstNameMinLength || firstName.count > SignUpConstants.firstNameMaxLength{
            isValid = false
        }
        return isValid
    }
    
    func isValidPassword(password:String)-> Bool {
        var isValid = true
        
        if password.count < SignUpConstants.minPasswordLength {
            isValid = false
        }
        return isValid
    }
    
    
    func isValidLastNme(lastName: String)  -> Bool {
        var isValid = true
        
        if lastName.count <=  SignUpConstants.firstNameMinLength || lastName.count > SignUpConstants.lastNameMaxLength {
            isValid =  false
        }
        
        return isValid
    }
    
    func IsPasswordMatched(password:String,Repeated:String) -> Bool {
        return password == Repeated
    }
}
