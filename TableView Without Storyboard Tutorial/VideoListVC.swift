//
//  VideoListVC.swift
//  TableView Without Storyboard Tutorial
//
//  Created by macintosh on 15/02/2021.
//

import UIKit

class VideoListVC: UIViewController {
    
    var tableView = UITableView()
    var videos : [Video] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chairs Collection"
        self.videos = self.fetchData()
        self.configureTableView()

        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        self.view.addSubview(self.tableView)
        self.setTableViewDelegates()
        self.tableView.rowHeight = 100
        self.tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        self.tableView.pin(to: self.view)
    }
    
    func setTableViewDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

//MARK: -

extension VideoListVC : UITableViewDelegate {
    
}

extension VideoListVC : UITableViewDataSource {
    
    // ask us about how many cells we want to add in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    // ask us which custom concrete cell we want to use
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        
        cell.set(video: video)
        
        return cell
        
        
    }
}

extension VideoListVC {
    func fetchData() -> [Video] {
        return [Video(image: Images.anotherDanishChair, title: "Another Danish Chair"),
                Video(image: Images.yetAnotherDanishChair, title: "Yet Another Danish Chair"),
                Video(image: Images.danishChair, title: "Danish Chair"),
                Video(image: Images.greyChair, title: "Grey Chair"),
                Video(image: Images.modernChair, title: "Modern Chair"),
                Video(image: Images.peacockChair, title: "Peacock Chair"),
                Video(image: Images.roundChair, title: "Round Chair")]
    }
}
