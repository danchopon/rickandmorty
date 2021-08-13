//
//  FooterActivityIndicatorView.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit

class FooterActivityIndicatorView: UIView {
    lazy var activityIndicatorView = makeActivityIndicatorView()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FooterActivityIndicatorView {
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startAnimating()
        return view
    }
}

extension FooterActivityIndicatorView {
    func setupSubviews() {
        addSubview(activityIndicatorView)
    }
    
    func setupConstraints() {
        activityIndicatorView.anchor(
            .centerX(centerXAnchor),
            .centerY(centerYAnchor),
            .height(50),
            .width(50)
        )
    }
}
