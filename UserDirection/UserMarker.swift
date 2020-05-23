//
//  UserMarker.swift
//  UserDirection
//
//  Created by Alexander Nikolaychuk on 23.05.2020.
//  Copyright © 2020 AlexAlmostEngineer. All rights reserved.
//

import UIKit

class UserMarker: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let image = UIImageView(image: UIImage(named: "CarIcon.png"))
        image.frame = self.bounds
        self.addSubview(image)
    }
    
}
