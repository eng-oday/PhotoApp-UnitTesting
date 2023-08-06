//
//  SignUpPresenter.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation


class SignUpPresenter {
    
    var signUpFormValidator:SignUpModelValidatorProtocol
    var signUpWebService:SignUpWebServiceProtocol
    
    init(signUpFormValidator: SignUpModelValidatorProtocol , SignUpWebService:SignUpWebServiceProtocol) {
        self.signUpFormValidator = signUpFormValidator
        self.signUpWebService = SignUpWebService
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
        let signUpFormModel = SignUpFormRequestModel(firstName: "", lastName: "", email: "", password: "")
        
        signUpWebService.SignUp(withForm: signUpFormModel) { response, error in
            // TODO
        }
    }
    
}
