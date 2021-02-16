//
//  VideoCell.swift
//  TableView Without Storyboard Tutorial
//
//  Created by macintosh on 15/02/2021.
//

import UIKit

class VideoCell: UITableViewCell {
    var videoImageView = UIImageView()
    var videoTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.videoImageView)
        self.addSubview(self.videoTitleLabel)
        
        self.configureImageView()
        self.configureTitleLabel()
        
        self.setImageViewConstraints()
        self.setTitleLabelConstraints()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video) {
        self.videoImageView.image = video.image
        self.videoTitleLabel.text = video.title
    }
    
    func configureImageView() {
        self.videoImageView.layer.cornerRadius = 50
        self.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        // label with two lines and more will be wrapped due to this option
        self.videoTitleLabel.numberOfLines = 0
        // font will be reduced in case it will be too large for the label width size
        self.videoTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setImageViewConstraints() {
        self.videoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.videoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.videoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        self.videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.videoImageView.widthAnchor.constraint(equalTo: self.videoImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        self.videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.videoTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.videoTitleLabel.leadingAnchor.constraint(equalTo: self.videoImageView.trailingAnchor, constant: 20).isActive = true
        self.videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.videoTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
    }
    
}
