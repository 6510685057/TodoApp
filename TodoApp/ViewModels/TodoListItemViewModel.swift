//
//  TodoListItemViewModel.swift
//  TodoApp
//
//  Created by นางสาวญาณัชทัฬห์ คงกระจ่าง on 9/4/2568 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewModel: ObservableObject {
    func toggleIsDone(item: TodoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
