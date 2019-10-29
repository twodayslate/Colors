//
//  FirstViewController.swift
//  Colors
//
//  Created by Zachary Gorak on 10/28/19.
//  Copyright © 2019 twodayslate. All rights reserved.
//

import UIKit

class FirstViewController: UICollectionViewController {

    var classic: [UIColor] = [
        .black,
        .blue,
        .brown,
        .clear,
        .cyan,
        .darkGray,
        .darkText,
        .gray,
        .green,
        .label,
        .lightGray,
        .lightText,
        .link,
        .magenta,
        .opaqueSeparator,
        .orange,
        .placeholderText,
        .purple,
        .red,
        .separator,
        .white,
        .yellow
    ]
    
    var colors: [UIColor] = [
        .systemBlue,
        .systemGreen,
        .systemTeal,
        .systemRed,
        .systemGray,
        .systemPink,
        .systemIndigo,
        .systemOrange,
        .systemPurple
    ]
    
    var grays: [UIColor] = [
        .systemGray,
        .systemGray2,
        .systemGray3,
        .systemGray4,
        .systemGray5,
        .systemGray6
    ]
    
    var system: [UIColor] = [
        .systemFill,
        .systemBackground,
        .systemGroupedBackground,
    ]
    
    var quaternary: [UIColor] = [
        .quaternaryLabel,
        .quaternarySystemFill
    ]
    
    var secondary: [UIColor] = [
        .secondarySystemBackground,
        .secondarySystemGroupedBackground,
        .secondaryLabel,
        .secondarySystemFill
    ]
    
    var tertiary: [UIColor] = [
        .tertiarySystemFill,
        .tertiaryLabel,
        .tertiarySystemBackground,
        .tertiarySystemGroupedBackground
    ]
    
    var colorList: [[UIColor]] {
        return [classic, colors, grays, system, quaternary, secondary, tertiary]
    }
    
    init() {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.minimumInteritemSpacing = 8.0
        layout.minimumLineSpacing = 8.0
        let size = self.view.frame.width/5
        layout.itemSize = CGSize(width: size, height: size + 24.0)
        
        self.collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "color")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let systemColor = colorList[indexPath.section][indexPath.row]
        
        let color = systemColor.resolvedColor(with: .current)
        
        let ci = CIColor(color: color)
        
        let alert = UIAlertController(title: systemColor.name ?? "NAME", message: "\(color.name)\nR \(ci.red) B \(ci.blue) G \(ci.green) A \(ci.alpha)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Set as Background", style: .default, handler: { _ in
            self.collectionView.backgroundColor = systemColor
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return colorList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorList[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "color", for: indexPath)
        
        (cell as? ColorCell)?.color = colorList[indexPath.section][indexPath.row]
        return cell
    }
}

class ColorCell: UICollectionViewCell {
    
    var color: UIColor? {
        didSet {
            self.colorView.backgroundColor = self.color
            name.text = self.color?.name ?? "NAME"
        }
    }
    
    let name = UILabel()
    let colorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        name.textColor = .white
        name.backgroundColor = .black
        name.adjustsFontSizeToFitWidth = true
        name.textAlignment = .center
        name.baselineAdjustment = .alignBaselines
        
        self.contentView.addSubview(stack)
        
        stack.addArrangedSubview(colorView)
        stack.addArrangedSubview(name)
        
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollview]|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": stack]))
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollview]|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": stack]))
        
        //name.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

