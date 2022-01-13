//
//  NestedTimer.swift
//  app-15-puzzle-swiftUIApp
//
//  Created by Gleb Engalychev on 13.01.2022.
//

import Foundation
import SwiftUI

class NestedTimer {
    var timer = Timer()
    var brain: GameBrain
    @Binding var time: Int
    
    init(time: Binding<Int>, brain: GameBrain) {
        self.brain = brain
        self._time = time
    }
    
    @objc private func timerAction() {
        brain.incrementTime()
        time = brain.getTime()
    }
    
    private func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
}
