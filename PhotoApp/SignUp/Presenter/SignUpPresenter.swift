//
//  SignUpPresenter.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation


class SignUpPresenter {
    
    var signUpFormValidator:SignUpModelValidatorProtocol
    
    init(signUpFormValidator: SignUpModelValidatorProtocol) {
        self.signUpFormValidator = signUpFormValidator
    }
    
    func processUserSignUp(formModel:SignUpFormModel) {
        if !signUpFormValidator.IsValidFirstName(formModel.firstName) {
            return
        }
        if !signUpFormValidator.isValidLastNme(lastName: formModel.lastName) {
            return
        }
        if !signUpFormValidator.IsPasswordMatched(password: formModel.password, Repeated: formModel.repeatPassword) {
            return
        }
        if !signUpFormValidator.isValidPassword(password: formModel.password){
            return
        }
    }
}
