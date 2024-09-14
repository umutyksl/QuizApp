//
//  Kavramlar.swift
//  quizApp
//
//  Created by Umut Yüksel on 2.09.2024.
//

import Foundation

class Kavramlar {
    var soru:String?
    var a:String?
    var b:String?
    var c:String?
    var d:String?
    var correctAnswer:String?
    
    init(){
        
    }
    
    init(soru: String, a: String, b: String, c: String, d: String, correctAnswer: String) {
        self.soru = soru
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.correctAnswer = correctAnswer
    }
}
