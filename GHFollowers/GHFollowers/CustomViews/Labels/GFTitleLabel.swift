//
//  GFTittleLabel.swift
//  GHFollowers
//
//  Created by Daria on 21.02.2024.
//

import UIKit

class GFTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        cofigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAligment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAligment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    private func cofigure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
