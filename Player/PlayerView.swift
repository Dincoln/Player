//
//  PlayerView.swift
//  Player
//
//  Created by Dincoln on 2019/2/18.
//  Copyright © 2019年 Dincoln. All rights reserved.
//

import UIKit
import MobileVLCKit
class PlayerView: UIView {
    let player = VLCMediaPlayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews () {
        player.drawable = self
        player.delegate = self
        let path = Bundle.main.path(forResource: "video", ofType: "mp4")
        player.media = VLCMedia(path: path!)
        player.play()
        player.media.length.intValue
    }

}

extension PlayerView: VLCMediaPlayerDelegate {
    func mediaPlayerStateChanged(_ aNotification: Notification!) {
        print(aNotification)
    }
}
