//
//  CellManager.swift
//  CoffeeApp
//
//  Created by Sofa on 22.09.23.
//

import UIKit

class CellManager {
    static func configure(_ cell: UITableViewCell, with coffee: Coffee ) {
        cell.textLabel?.text = coffee.name
        cell.detailTextLabel?.text = String(coffee.price) + " BYN"
        cell.imageView?.image = coffee.image
    }
    
}
