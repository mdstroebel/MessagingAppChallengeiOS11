//
//  MessageCollectionViewCell.swift
//  MessagingAppChallengeiOS11
//
//  Created by 24com on 4/7/2022.
//

import Foundation
import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(label)
        
        label.frame = self.contentView.frame
        label.textAlignment = .center
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(message: MessageModel) {
        self.label.text = message.text
    }
}
