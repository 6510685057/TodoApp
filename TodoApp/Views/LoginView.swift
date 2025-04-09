//
//  LoginView.swift
//  TodoApp
//
//  Created by นางสาวญาณัชทัฬห์ คงกระจ่าง on 2/4/2568 BE.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "To Do List", subtitle: "Get things done",
                    background: .red)
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                VStack {
                    Text("New Around Here")
                    NavigationLink(
                        "Create an Account", destination: RegisterView())
                }
                .alert(isPresented: $viewModel.isError) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Invalid Credential")
                    )
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
