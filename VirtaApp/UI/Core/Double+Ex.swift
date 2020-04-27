//
//  DistanceText.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI

extension Double {
    var asDistantText: String {
        if self < 100 {
            return "\(Int(self)) m"
        } else {
            return String(format:"%.1f km", self/1000)
        }
    }
}
