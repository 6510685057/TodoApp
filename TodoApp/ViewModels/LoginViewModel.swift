//
//  LoginViewModel.swift
//  TodoApp
//
//  Created by นางสาวญาณัชทัฬห์ คงกระจ่าง on 2/4/2568 BE.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var isError = false

    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ _, error in
            if let error = error {
                self.isError = true
            }
        }
    }
}
