//
//  AVPlayer+Extension.swift
//  iOSAutoVideo
//
//  Created by Karan . on 2/10/23.
//

import Foundation
import AVKit

extension AVPlayer {
    
    var isPlaying:Bool {
        get {
            return (self.rate != 0 && self.error == nil)
        }
    }
    
}
