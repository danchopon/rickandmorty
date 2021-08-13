//
//  CharacterContentView.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit

class CharacterContentView: UIView {
    lazy var tableView = makeTableView()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharacterContentView {
    func setupSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.fillSuperview()
    }
}

private extension CharacterContentView {
    func makeTableView() -> UITableView {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = UITableView.automaticDimension
        return view
    }
}
