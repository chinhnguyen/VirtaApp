//
//  IconTextField.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/26/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI

struct IconTextField: View {
    var icon: String
    var placeholder: LocalizedStringKey
    var text: Binding<String>
    var onCommit: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                Image(icon)
                TextField(placeholder, text: text, onCommit: onCommit)
                    .frame(height: 44.0)
            }
            Divider()
                .frame(height: 1.0)
        }
    }
}

struct IconTextField_Previews: PreviewProvider {
    static var previews: some View {
        IconTextField(icon: "icPerson", placeholder: "Username", text: .constant(""))
    }
}
