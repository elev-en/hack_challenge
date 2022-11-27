//
//  CoursesCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/26/22.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell {
    
    var course = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        

        course.backgroundColor = .systemPurple
        course.font = .systemFont(ofSize: 10, weight: .regular)
        course.textColor = UIColor.black
        course.translatesAutoresizingMaskIntoConstraints = false
        course.layer.cornerRadius = 15
        course.isUserInteractionEnabled = false
        course.textAlignment = .center
        contentView.addSubview(course)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            course.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            course.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            course.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }

    func configure(courseVar: Course) {
        course.text = courseVar.name
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
