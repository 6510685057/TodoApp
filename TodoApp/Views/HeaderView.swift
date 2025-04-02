//
//  HeaderView.swift
//  TodoApp
//
//  Created by นางสาวญาณัชทัฬห์ คงกระจ่าง on 2/4/2568 BE.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.orange)
                .rotationEffect(Angle(degrees: -15))
            VStack{
                Text("Register")
                    .font(.system(size: 45))
                    .fontDesign(.rounded)
                    .bold()
                Text("Start organizing todos")
                    .font(.system(size: 25))
            }
            .foregroundColor(.white)
            .padding(.top,70)
        }
        .frame(width: UIScreen.main.bounds.width * 2, height: 300)
        .offset(y:-150)
    }
}

#Preview{
    HeaderView(title: "Title", subtitle: "subtitle", background: .pink)
}
    

