//
//  CoursesCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/26/22.
//
 
import UIKit
 
class CoursesCollectionViewCell: UICollectionViewCell {
    
    let course = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        contentView.layer.cornerRadius = 7
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 0.843, green: 0.855, blue: 0.988, alpha: 1.00)
 
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        course.font = UIFont.systemFont(ofSize: 10)
        course.numberOfLines = 0
        course.textColor = UIColor.black
        course.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(course)
    }
 
 
    func setupConstraints() {
        NSLayoutConstraint.activate([
            course.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            course.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
    }
 
    func configure(courseVar: Course) {
        course.text = courseVar.name
    }
    
 
}
