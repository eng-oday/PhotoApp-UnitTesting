//
//  SignUpPresenterProtocol.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 08/08/2023.
//

import Foundation


protocol SignUpPresenterProtocol {
    init(signUpFormValidator: SignUpModelValidatorProtocol , SignUpWebService:SignUpWebServiceProtocol,SignUpviewDelegate:SignUpViewDelegateProtocol)
    func processUserSignUp(formModel:SignUpFormModel)
}
