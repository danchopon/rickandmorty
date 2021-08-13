//
//  CharacterViewController.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit

protocol CharacterViewControllerOutput: CharacterModelInput {}
protocol CharacterViewControllerInput: CharacterModelOutput {}

class CharacterViewController: UIViewController {
    let model: CharacterModel
    let contentView: CharacterContentView
    private let footerView = FooterActivityIndicatorView()
    
    init(contentView: CharacterContentView, model: CharacterModel) {
        self.contentView = contentView
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupTableView()
        model.perform(action: .load)
    }
    
    private func setupSubviews() {
        view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        contentView.fillSuperview()
    }
    
    private func setupTableView() {
        contentView.tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.description())
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension CharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayable = model.character(at: indexPath)
        let cell: CharacterCell = tableView.dequeueReusableCell(for: indexPath)
        cell.apply(displayable: displayable)
        return cell
    }
}

extension CharacterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return model.shouldShowActivityIndicator ? 200 : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        model.perform(action: .willDisplay(index: indexPath.row))
    }
}

extension CharacterViewController: CharacterViewControllerInput {
    func didStartActivity(_ activity: CharacterActivity) {
        switch activity {
        case .loading:
            self.contentView.tableView.reloadData()
        }
    }
    
    func didFinishActivity(_ activity: CharacterActivity) {
        switch activity {
        case .loading:
            contentView.tableView.reloadData()
        }
    }
    
    func didFinishActivity(_ activity: CharacterActivity, with error: Error) {
        switch activity {
        case .loading:
            contentView.tableView.reloadData()
        }
    }
}
