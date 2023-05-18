//
//  CustomCell.swift
//  (R4)Lesson-1(HomeWork)
//
//  Created by Ahmed Muvaza on 18/5/23.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class CustomCell: UITableViewCell {
    
    static let idCell = "CustomCell"
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descr = UILabel()
        descr.font = .systemFont(ofSize: 11)
        descr.numberOfLines = 5
        descr.textAlignment = .justified
        
        return descr
    }()
    
    private lazy var imageOfNews: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        self.addSubview(imageOfNews)
        imageOfNews.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(140)
        }
        
        imageOfNews.layer.cornerRadius = imageOfNews.frame.height / 4
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        
        self.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(0.3)
        }
    }
    
    func configure(with: Article) {
        self.titleLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.imageOfNews.kf.setImage(with: URL(string: with.urlToImage!))
    }
}
