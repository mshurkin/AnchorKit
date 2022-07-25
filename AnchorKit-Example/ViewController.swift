//
//  ViewController.swift
//  AnchorKit-Example
//
//  Created by Максим Шуркин on 30/09/2018.
//  Copyright © 2018-2022 Maxim Shurkin
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
