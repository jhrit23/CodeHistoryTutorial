//
//  ContentView.swift
//  CodeHistoryTutorial
//
//  Created by Jonathan Hesler on 5/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    let question = Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Bettle", "Moth", "Fly"], correctAnswerIndex: 2)
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                Text("1 / 10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack {
                  ForEach(0..<question.possibleAnswers.count) { answerIndex in
                    Button(action: {
                      print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                      mainColor = answerIndex == question.correctAnswerIndex ? .green : .red
                    }, label: {
                      ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                    })
                  }
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
