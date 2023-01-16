//
//  CustomButton.swift
//  diary
//
//  Created by Акмарал Тажиева on 06.12.2022.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize ) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = hasBackground ? #colorLiteral(red: 0.9260049462, green: 0.2680995464, blue: 0.7393044233, alpha: 1): .clear
        
        let titleColor: UIColor = hasBackground ? .white : #colorLiteral(red: 0.9260049462, green: 0.2680995464, blue: 0.7393044233, alpha: 1)
        self.setTitleColor(titleColor, for: .normal)
        
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
