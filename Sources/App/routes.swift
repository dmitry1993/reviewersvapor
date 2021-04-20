import Vapor

private let savedReviewers = ["Dmitry Holub", "Aliaksandr Batyesheu", "Andrei Olesau",
                              "Anna Kazhuro", "Vlad Kubicki", "Maksim Panamarou",
                              "Natalia Semicheva", "Tatsiana Gouteeva", "Vladimir Martyniuk", "Yan Schneider",
                              "Dmitry Holub"]
private var reviewers: [String] = []

func routes(_ app: Application) throws {
    
    app.get { req -> String in
        return getReviewers()
    }
    
    app.get("list") { req -> [String] in
        return savedReviewers
    }
}

func getReviewers() -> String {
    var reviewersString = ""
    if reviewers.count < 2 {
        reviewers = savedReviewers
    }
    let firstReviewer = Int.random(in: 0..<reviewers.count)
    reviewersString = reviewers[firstReviewer]
    reviewers.remove(at: firstReviewer)
    var secondReviewer = Int.random(in: 0..<reviewers.count)
    while firstReviewer == secondReviewer {
        secondReviewer = Int.random(in: 0..<reviewers.count)
    }
    reviewersString += " and " + reviewers[secondReviewer]
    reviewers.remove(at: secondReviewer)
    return reviewersString
}
