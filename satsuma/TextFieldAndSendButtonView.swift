//
//  TextFieldAndSendButtonView.swift
//  satsuma
//
//  Created by Gogo on 08/01/26.
//

import SwiftUI

struct TextFieldAndSendButtonView: View {
    var sendMessage: () -> Void
    @Binding var existingDraft: String
    @FocusState private var isFocusOnDraft
    
    var body: some View {
        HStack {
            TextField("Write your message here", text: $existingDraft)
                .onSubmit(sendMessage)
                .border(.black)
                .padding()
                .focused($isFocusOnDraft)
            
            Button(action: sendMessage) {
                Image(systemName: "paperlane")
            }
            .disabled(existingDraft == "")
        }
    }
}

#Preview {
    @Previewable var existingDraft: Binding<String> = Binding.constant("")
    
    return TextFieldAndSendButtonView(sendMessage: {
        print("Message sent")
    }, existingDraft: existingDraft)
}
