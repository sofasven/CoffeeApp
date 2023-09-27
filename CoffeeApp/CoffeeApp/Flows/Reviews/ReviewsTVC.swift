//
//  ReviewsTVC.swift
//  CoffeeApp
//
//  Created by Sofa on 25.09.23.
//

import UIKit

class ReviewsTVC: UITableViewController {
    
    var feedback: [Feedback]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reviews"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let feedback = feedback else { return 0 }
        return feedback.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(feedback?[indexPath.row].date ?? Date())"
        cell.detailTextLabel?.text = (feedback?[indexPath.row].text ?? "") + "\n" + "\(Calculating.countStars(mark: feedback?[indexPath.row].mark ?? 0))"
        cell.backgroundColor = .lightGray

        return cell
    }

}
