//
//  SignInHeaderView.swift
//  diary
//
//  Created by Акмарал Тажиева on 05.12.2022.
//

import UIKit

class AuthHeaderView: UIView {

    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.backgroundColor = .systemBackground
        return logoImageView
                                    
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
        
    }()
    
    init(title: String) {
           super.init(frame: .zero)
           self.titleLabel.text = title
           
           self.setupUI()
       }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    
    private func setupUI() {
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)


        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 70),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

            self.titleLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 19),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),


        ])
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        let size = width/4
//        logoImageView.frame = CGRect(x: (width - size)/2, y: 10, width: size, height: size)
//        titleLabel.frame = CGRect(x: 20, y: logoImageView.bottom+10, width: width-40, height: height-size-30)
//    }
}
