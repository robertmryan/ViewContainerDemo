//
//  ViewController.swift
//  ViewContainerDemo
//
//  Created by Robert Ryan on 2/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
    }
}

private extension ViewController {
    func addChildViewControllers() {
        let dvc = RedViewController()
        addChild(dvc)
        view.addSubview(dvc.view)
        dvc.view.translatesAutoresizingMaskIntoConstraints = false
        dvc.didMove(toParent: self)

        let svc = BlueViewController()
        addChild(svc)
        svc.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(svc.view)
        svc.didMove(toParent: self)

        NSLayoutConstraint.activate([
            dvc.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dvc.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dvc.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            svc.view.topAnchor.constraint(equalTo: dvc.view.bottomAnchor),

            svc.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            svc.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            svc.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            dvc.view.heightAnchor.constraint(equalTo: svc.view.heightAnchor)
        ])
    }
}

