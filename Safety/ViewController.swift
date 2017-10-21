//
//  ViewController.swift
//  Safety
//
//  Created by Kyle Rohr on 7/10/17.
//  Copyright © 2017 Kyle Rohr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showDummy(_ sender: AnyObject) {
        let layout = UICollectionViewFlowLayout()

        layout.itemSize = CGSize(width: 300.0, height: 44.0)
        layout.sectionInsetReference = .fromSafeArea

        let dummy = DummyCollectionViewController(collectionViewLayout: layout)

        let nav = UINavigationController(rootViewController: dummy)

        present(nav, animated: true, completion: nil)
    }

}

