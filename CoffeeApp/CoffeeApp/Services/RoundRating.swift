//
//  RoundRating.swift
//  CoffeeApp
//
//  Created by Sofa on 25.09.23.
//

import UIKit

class Calculating {

   static func roundRating(index: Int) -> String {
        let coffee = CoffeeData.shared.coffees[index]
        var sum = 0.0
        var rating = 0.0
        let feedbacks = coffee.feedbacks
        for feedback in feedbacks {
            sum += feedback.mark
        }
        rating = sum / Double(feedbacks.count)
        switch rating {
        case 1...1.4:
            return "⭐️"
        case 1.5...2.4:
            return "⭐️⭐️"
        case 2.5...3.4:
            return "⭐️⭐️⭐️"
        case 3.5...4.4:
            return "⭐️⭐️⭐️⭐️"
        case 4.5...5.0:
            return "⭐️⭐️⭐️⭐️⭐️"
        default:
            return "No reviews"
        }
    }
}



