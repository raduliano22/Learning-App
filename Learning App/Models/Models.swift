//
//  Models.swift
//  Learning App
//
//  Created by Octav Radulian on 12.04.2022.
//

import Foundation

// we are crating the structure mapped to the form of the local json file , it will be decodable to take the data and identifiable to loop in it

struct Module: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var content: Content
    var test: Test
    
}

struct Content: Decodable, Identifiable {
    
    var id: Int
    var time: String
    var image: String
    var description: String
    var lessons: [Lesson]
    
}

struct Lesson: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}

struct Test: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var question: [Question]
}

struct Question: Decodable, Identifiable {
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
