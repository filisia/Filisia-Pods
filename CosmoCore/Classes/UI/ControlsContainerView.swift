//
//  ControlsContainerView.swift
//  CosmoCore
//
//  Created by Alkiviadis Papadakis on 04/04/2020.
//

import UIKit

final public class ControlsContainerView: UIView {
    public init(leftSideViews: [UIView], rightSideViews: [UIView]) {
        super.init(frame: .zero)
        let leftContainer = sideContainer(contentViews: leftSideViews)
        let rightConainer = sideContainer(contentViews: rightSideViews)

        let mainStackView = UIStackView(arrangedSubviews: [leftContainer, rightConainer])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .horizontal
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually

        self.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    private func sideContainer(contentViews: [UIView]) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(arrangedSubviews: contentViews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        if #available(iOS 11.0, *) {
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 70, bottom: 0, trailing: 35)
        } else {
            stackView.layoutMargins = UIEdgeInsets(top: 20, left: 70, bottom: 0, right: 35)
        }

        container.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: container.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor)
        ])
        return container
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
