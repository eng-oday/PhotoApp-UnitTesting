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
    var delegate:SignUpViewDelegateProtocol
    
    init(signUpFormValidator: SignUpModelValidatorProtocol , SignUpWebService:SignUpWebServiceProtocol,SignUpviewDelegate:SignUpViewDelegateProtocol) {
        self.signUpFormValidator    = signUpFormValidator
        self.signUpWebService       = SignUpWebService
        self.delegate               = SignUpviewDelegate
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
            
            if let error = error {
                self.delegate.errorHandler(Error: error)
                return
            }else {
                self.delegate.successfullySignUp()
            }
        }
    }
    
}
