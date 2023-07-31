//
//  SignInFormModelValidate.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 31/07/2023.
//

import Foundation


class SignInFormModelValidate {
    
    
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
}
