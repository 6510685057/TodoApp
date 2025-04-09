//
//  NewItemView.swift
//  TodoApp
//
//  Created by นางสาวญาณัชทัฬห์ คงกระจ่าง on 9/4/2568 BE.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top,50)
            Form{
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "save", background: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fill in all fields and select due date that is today or newer")
                )
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
