//
//  DonkeyCell.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 16/01/22.
//

import UIKit
import Reusable

final class TitleTableViewCell: UITableViewCell, Reusable {
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        ])
    }
    
    func config(with text: String) {
        titleLabel.text = text
    }
}
