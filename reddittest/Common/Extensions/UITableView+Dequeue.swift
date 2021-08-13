//
//  UITableView+Dequeue.swift
//  GoClass
//
//  Created by Daniiar Erkinov on 3/6/21.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.description(), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.description())")
        }
        
        return cell
    }
}
