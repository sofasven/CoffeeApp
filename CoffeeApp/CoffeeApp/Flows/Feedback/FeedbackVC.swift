//
//  FeedbackVC.swift
//  CoffeeApp
//
//  Created by Sofa on 25.09.23.
//

import UIKit

class FeedbackVC: UIViewController {
    
    var index: Int?
    
    @IBOutlet weak var textReview: UITextView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var mark: UISegmentedControl!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        guard let indexPath = index else { return }
        let feedback = Feedback(text: textReview.text, mark: Double(mark.selectedSegmentIndex + 1))
        CoffeeData.shared.coffees[indexPath].feedbacks.append(feedback)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        updateSaveBtn()
    }
    
    private func setupUI() {
        saveBtn.isEnabled = false
        errorLbl.isHidden = true
        mark.selectedSegmentIndex = .max
        textReview.backgroundColor = .black
        textReview.textColor = .white
    }
    private func updateSaveBtn() {
        let numberOfCharacters = textReview.text.description.count
        saveBtn.isEnabled = numberOfCharacters > 20
        errorLbl.isHidden = numberOfCharacters > 20
    }
}
