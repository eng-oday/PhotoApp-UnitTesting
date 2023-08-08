//
//  SignUpViewController.swift
//  PhotoApp
//
//  Created by 3rabApp-oday on 07/08/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton:UIButton!
    
    var signUpPresenter:SignUpPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if signUpPresenter == nil {
            let signUpFormValidator = SignUpFormModelValidate()
            let signUpWebService = SignUpWebService(urlString: SignUpConstants.signUpUrlString)
            signUpPresenter = SignUpPresenter(signUpFormValidator: signUpFormValidator, SignUpWebService: signUpWebService, SignUpviewDelegate: self)
        }
    }

    @IBAction func SignUpButtonTapped(_ sender: Any) {
        let signUpFormModel = SignUpFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
        signUpPresenter?.processUserSignUp(formModel: signUpFormModel)
    }
    
    

}

extension SignUpViewController:SignUpViewDelegateProtocol {
    
    func successfullySignUp() {
        
    }
    
    func errorHandler(Error: SignUpError) {
        
    }
}
