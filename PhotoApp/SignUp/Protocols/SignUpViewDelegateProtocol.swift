//
//  SignUpViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 06/08/2023.
//

import Foundation


protocol SignUpViewDelegateProtocol {
    func successfullySignUp()
    func errorHandler(Error:SignUpError)
}
