//
//  ViewController.swift
//  iOSAutoVideo
//
//  Created by Karan . on 2/10/23.
//

import UIKit

class SocialMediaHomeVC: UIViewController {
    
   // MARK: - IBOutlets
    //========================================
    @IBOutlet weak var postTableView: UITableView!
    
    // MARK: - View Controller Life Cycle
     //========================================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpDataSource()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTableView()
        self.postTableView.reloadData()
        self.playFirstVisibleVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.playFirstVisibleVideo(false)
    }
    
    func setUpUI() {
        self.view.backgroundColor = .white
        self.postTableView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9411764706, alpha: 1)
    }
    
    func setupTableView() {
        postTableView.register(UINib.init(nibName: "SocialMediaPostCell", bundle: nil), forCellReuseIdentifier: "SocialMediaPostCell")

        postTableView.delegate = self
        postTableView.dataSource = self

//        postTableView.isPagingEnabled = false
//        postTableView.isScrollEnabled = true
//        postTableView.backgroundColor = .white
//        postTableView.showsVerticalScrollIndicator = true
//        postTableView.showsHorizontalScrollIndicator = false
     

    }
    
    var dataSource:[String] = []
    
    func setUpDataSource() {
        dataSource = [
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
        ]
        
    }
    
}

extension SocialMediaHomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.postTableView.dequeueReusableCell(withIdentifier: "SocialMediaPostCell", for: indexPath) as? SocialMediaPostCell else
        {
            return UITableViewCell()
        }
        cell.configure(dataSource[indexPath.item])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension SocialMediaHomeVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        playFirstVisibleVideo()
    }
    
}

extension SocialMediaHomeVC {
    
    func playFirstVisibleVideo(_ shouldPlay:Bool = true) {
   
        let cells = postTableView.visibleCells.sorted {
            postTableView.indexPath(for: $0)?.item ?? 0 < postTableView.indexPath(for: $1)?.item ?? 0
        }
  
        let videoCells = cells.compactMap({ $0 as? SocialMediaPostCell })
        if videoCells.count > 0 {
            
            let firstVisibileCell = videoCells.first(where: { checkVideoFrameVisibility(ofCell: $0) })
         
            for videoCell in videoCells {
                if shouldPlay && firstVisibileCell == videoCell {
                    videoCell.play()
                }
                else {
                    videoCell.pause()
                }
            }
        }
    }
    
    func checkVideoFrameVisibility(ofCell cell: SocialMediaPostCell) -> Bool {
        var cellRect = cell.bounds
        cellRect = cell.convert(cell.bounds, to: postTableView.superview)
        return postTableView.frame.contains(cellRect)
    }
    
}





