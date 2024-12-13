import Foundation


class BigBrain {
    var getAnswer: ((String) -> Void)?

    func askQuestion(questionText: String) {
        // Simulate a delay of 2 seconds and then return an answer
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if let answerHandler = self.getAnswer {
                if questionText == "Ultimate Question of Life, The Universe, and Everything" {
                    answerHandler("42")
                } else {
                    answerHandler("¯\\_(ツ)_/¯")
                }
            }
        }
    }
}
