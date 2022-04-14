//
//  CodeTextView.swift
//  Learning App
//
//  Created by Octav Radulian on 14.04.2022.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    func updateUIView(_ textView: UITextView, context: Context) {
        
        //set the atributed text for the lesson
        textView.attributedText = model.lessonDescription
        
        //scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
