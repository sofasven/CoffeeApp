//
//  CoffeeDetailVC.swift
//  CoffeeApp
//
//  Created by Sofa on 22.09.23.
//

import UIKit

class CoffeeDetailVC: UIViewController {
    
    var index: Int?
    
    var coffee: Coffee {
        CoffeeData.shared.coffees[index ?? 0]
    }
    
    @IBOutlet weak var coffeeStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coffeeNameLbl: UILabel!
    @IBOutlet weak var coffeePriceLbl: UILabel!
    @IBOutlet weak var coffeeRatingLbl: UILabel!
    @IBOutlet weak var showReviewsBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI(with: view.bounds.size)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let feedbackVC = segue.destination as? FeedbackVC else { return }
        feedbackVC.index = index
    }
    @IBAction func viewReviews(_ sender: UIButton) {
        let stor = UIStoryboard(name: "Main", bundle: nil)
        guard let reviewsTVC = stor.instantiateViewController(withIdentifier: "ReviewsTVC") as? ReviewsTVC else { return }
        reviewsTVC.feedback = coffee.feedbacks
        navigationController?.pushViewController(reviewsTVC, animated: true)
    }
    
    
    private func updateUI(with size: CGSize) {
        let isVertical = size.width < size.height
        coffeeStackView.axis = isVertical ? .vertical : .horizontal
        title = coffee.name
        imageView.image = coffee.image
        coffeeNameLbl.text = coffee.name
        coffeePriceLbl.text = String(coffee.price) + " BYN"
        coffeeRatingLbl.text = Calculating.roundRating(index: index ?? 0)
        showReviewsBtn.setTitle("Посмотреть (\(coffee.feedbacks.count)) отзывов", for: .normal)
        showReviewsBtn.isEnabled = coffee.feedbacks.count != 0
    }

}
