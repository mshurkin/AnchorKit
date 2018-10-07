//
//  ViewController.swift
//  AnchorKit-Example
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018 Maxim Shurkin. All rights reserved.
//

import AnchorKit
import UIKit

class ViewController: UIViewController {

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "AnchorKit"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)
        redView.addSubview(label)

        redView.leadingAnchor == view.safeAreaLayoutGuide.leadingAnchor + 16
        redView.topAnchor == view.safeAreaLayoutGuide.topAnchor + 16
        redView.trailingAnchor == view.safeAreaLayoutGuide.trailingAnchor - 16
        redView.bottomAnchor == view.safeAreaLayoutGuide.bottomAnchor - 16

        label.centerXAnchor == redView.centerXAnchor
        label.centerYAnchor == redView.centerYAnchor
        label.widthAnchor == 2 * redView.widthAnchor / 3
    }
}
