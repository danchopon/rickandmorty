//
//  CharacterCell.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit
import Nuke

class CharacterCell: UITableViewCell {
    lazy var characterImageView = makeCharacterImageView()
    lazy var characterNameLabel = makeCharacterNameLabel()
    lazy var aliveStatusImageView = makeAliveStatusImageView()
    lazy var aliveStatusLabel = makeAliveStatusLabel()
    lazy var characterRaceLabel = makeCharacterRaceLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(displayable: CharacterDisplayable) {
        characterNameLabel.text = displayable.characterName
        aliveStatusImageView.image = displayable.statusImage
        characterRaceLabel.text = displayable.race
        Nuke.loadImage(with: displayable.imageURL, into: characterImageView)
        aliveStatusLabel.text = displayable.statusText
    }
    
}

extension CharacterCell {
    func setupSubviews() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(aliveStatusImageView)
        contentView.addSubview(aliveStatusLabel)
        contentView.addSubview(characterRaceLabel)
    }
    
    func setupConstraints() {
        characterImageView.anchor(
            .top(contentView.topAnchor, constant: 8),
            .leading(contentView.leadingAnchor, constant: 16),
            .bottom(contentView.bottomAnchor, constant: 8, priority: UILayoutPriority(999)),
            .height(120),
            .width(120)
        )
        characterNameLabel.anchor(
            .top(characterImageView.topAnchor, constant: 4),
            .leading(characterImageView.trailingAnchor, constant: 8),
            .trailing(contentView.trailingAnchor, constant: 16)
        )
        aliveStatusImageView.anchor(
            .top(characterNameLabel.bottomAnchor, constant: 4),
            .leading(characterNameLabel.leadingAnchor),
            .width(20),
            .height(20)
        )
        aliveStatusLabel.anchor(
            .centerY(aliveStatusImageView.centerYAnchor),
            .leading(aliveStatusImageView.trailingAnchor, constant: 4),
            .trailing(characterNameLabel.trailingAnchor)
        )
        characterRaceLabel.anchor(
            .top(aliveStatusImageView.bottomAnchor, constant: 4),
            .leading(characterNameLabel.leadingAnchor),
            .trailing(characterNameLabel.trailingAnchor)
        )
    }
}


private extension CharacterCell {
    func makeCharacterImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeCharacterNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func makeAliveStatusImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeAliveStatusLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func makeCharacterRaceLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
