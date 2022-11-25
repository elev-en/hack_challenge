//
//  ClassesTableViewCell.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/25/22.
//

import UIKit

class ClassesTableViewCell: UITableViewCell {

    let courseLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func setupViews(){
        courseLabel.textAlignment = .left
        courseLabel.font = UIFont.systemFont(ofSize: 15)
        courseLabel.lineBreakMode = .byWordWrapping
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = contentView.bounds.height/20
        let sidePadding: CGFloat = contentView.bounds.width/15
        
        NSLayoutConstraint.activate([
            courseLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            courseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            courseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            courseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
        ])
    }

    func configure(course: Course){
        courseLabel.text = course.name
    }
}
