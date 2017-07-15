//
//  ReportCategoryView.swift
//  Stay Safe Jamaica
//
//  Created by QualityWorks on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit

@IBDesignable class ReportCategoryView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var textLabel: UIButton!
    
    @IBInspectable var categoryText: String? {
        get {
            return textLabel.titleLabel?.text
        }
        set(text) {
            textLabel.setTitle(text, for: .normal)
        }
    }
    
    @IBInspectable var categoryImage: UIImage? {
        get {
            return categoryButton.imageView?.image
        }
        set(image) {
            categoryButton.imageView?.image = image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView() {
        // Set up
        Bundle.main.loadNibNamed("ReportCategoryView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
