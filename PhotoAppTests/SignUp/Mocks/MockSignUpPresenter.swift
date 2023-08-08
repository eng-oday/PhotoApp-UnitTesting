//
//  MockSignUpPresenter.swift
//  PhotoAppTests
//
//  Created by 3rabApp-oday on 08/08/2023.
//

import Foundation

@testable import PhotoApp
class MockSignUpPresenter:SignUpPresenterProtocol {

    var ProcessSignUpCalled:Bool =  false
    required init(signUpFormValidator: PhotoApp.SignUpModelValidatorProtocol, SignUpWebService: PhotoApp.SignUpWebServiceProtocol, SignUpviewDelegate: PhotoApp.SignUpViewDelegateProtocol) {
        // TODO
    }
    
    func processUserSignUp(formModel: PhotoApp.SignUpFormModel) {
        ProcessSignUpCalled = true
    }
}
