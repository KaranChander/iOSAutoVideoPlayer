//
//  SocialMediaPostCell.swift
//  iOSAutoVideo
//
//  Created by Karan . on 2/10/23.
//

import UIKit

class SocialMediaPostCell: UITableViewCell {

    // MARK: - IBOutlets
    //==============================================
    @IBOutlet weak var playerContainerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    // MARK: - Properties
    //==============================================
    let playerView: PlayerView = {
        let view = PlayerView()
        view.clipsToBounds = true
        return view
    }()

    
    // MARK: - TableView Lifecycle
    //==============================================
    var url: URL?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        let width: CGFloat = bounds.size.width
//        let height: CGFloat = (width * 0.9).rounded(.up)
        let width: CGFloat = playerContainerView.bounds.size.width
        let height: CGFloat = playerContainerView.bounds.size.height
        self.playerView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        playerView.backgroundColor = .clear

    }
    
    func setUpUI() {
        playerContainerView.clipsToBounds = true
        self.playerContainerView.layer.addSublayer(self.playerView.layer)
        profileImageView.layer.cornerRadius = 20
    }
    
    @objc
    func volumeAction(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
        playerView.isMuted = sender.isSelected
        PlayerView.videoIsMuted = sender.isSelected
    }
    
    func play() {
        if let url = url {
            playerView.prepareToPlay(withUrl: url, shouldPlayImmediately: true)
        }
    }
    
    func pause() {
        playerView.pause()
    }
    
    func configure(_ videoUrl: String) {
        guard let url = URL(string: videoUrl) else { return }
        self.url = url
        playerView.prepareToPlay(withUrl: url, shouldPlayImmediately: false)
    }
}
