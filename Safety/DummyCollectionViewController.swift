//
//  DummyCollectionViewController.swift
//  Safety
//
//  Created by Kyle Rohr on 18/10/17.
//  Copyright © 2017 Kyle Rohr. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class ItemCell: UICollectionViewCell {

    var textLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(textLabel)

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .white

        textLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        contentView.backgroundColor = .blue

        let bgView = UIView()
        bgView.backgroundColor = .yellow

        backgroundView = bgView
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        textLabel.text = ""
    }

}

class DataSource: NSObject, UICollectionViewDataSource {

    let items = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell

        let item = items[indexPath.item]

        cell.textLabel.text = item

        return cell
    }

}

class DummyCollectionViewController: UICollectionViewController {

    var dataSource = DataSource()

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.dataSource = dataSource
        collectionView?.delegate = self

        collectionView?.contentInsetAdjustmentBehavior = .never

        title = "Dummy"

        let backgroundView = UIView()

        backgroundView.backgroundColor = .white

        collectionView?.backgroundView = backgroundView

        collectionView?.register(ItemCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: view.frame.size.width, height: 44.0)
        }
    }

}
