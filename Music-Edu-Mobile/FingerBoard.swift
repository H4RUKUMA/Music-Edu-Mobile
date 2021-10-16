//
//  FingerBoard.swift
//  Music-Edu-Mobile
//
//  Created by Haru Toyama on 2021/10/13.
//

import Foundation

class fingerBoard {
    var string: [[String]] = [[],[],[],[],[],[]]
    
    func getInfo(key: Int, mode: Int, Scale: Int) -> [[String]] {
        for i in 0...5 {
            self.string[i].append(contentsOf: Array(repeating: "", count: 13))
        }
        switch (mode) {
        case 0: //Major
            switch (Scale) {
            case 0: //Natrual Major
                string[5] = ["M3","11","","5","","13","","M7","R","","9","","M3"]
                string[4] = ["M7","R","","9","","M3","11","","5","","13","","M7"]
                string[3] = ["5","","13","","M7","R","","9","","M3","11","","5"]
                string[2] = ["9","","M3","11","","5","","13","","M7","R","","9"]
                string[1] = ["13","","M7","R","","9","","M3","11","","5","","13"]
                string[0] = ["M3","11","","5","","13","","M7","R","","9","","M3"]
                break
            case 1: //Major Pentatonic
                string[5] = ["M3","","","5","","13","","","R","","9","","M3"]
                string[4] = ["","R","","9","","M3","","","5","","13","",""]
                string[3] = ["5","","13","","","R","","9","","M3","","","5"]
                string[2] = ["9","","M3","","","5","","13","","","R","","9"]
                string[1] = ["13","","","R","","9","","M3","","","5","","13"]
                string[0] = ["M3","","","5","","13","","","R","","9","","M3"]
                break
            default: break
            }
            break
        case 1: //Minor
            switch (Scale) {
            case 0: //Natrual Minor
                string[5] = ["","11","","5","♭13","","m7","","R","","9","m3",""]
                string[4] = ["","R","","9","m3","","11","","5","♭13","","m7",""]
                string[3] = ["5","♭13","","m7","","R","","9","m3","","11","","5"]
                string[2] = ["9","m3","","11","","5","♭13","","m7","","R","","9"]
                string[1] = ["","m7","","R","","9","m3","","11","","5","♭13",""]
                string[0] = ["","11","","5","♭13","","m7","","R","","9","m3",""]
                break
            case 1: //Minor Pentatonic
                string[5] = ["","11","","5","","","m7","","R","","","m3",""]
                string[4] = ["","R","","","m3","","11","","5","","","m7",""]
                string[3] = ["5","","","m7","","R","","","m3","","11","","5"]
                string[2] = ["","m3","","11","","5","","","m7","","R","",""]
                string[1] = ["","m7","","R","","","m3","","11","","5","",""]
                string[0] = ["","11","","5","","","m7","","R","","","m3",""]
                break
            case 2: //Dorian
                string[5] = ["","11","","5","","13","m7","","R","","9","m3",""]
                string[4] = ["","R","","9","m3","","11","","5","","13","m7",""]
                string[3] = ["5","","13","m7","","R","","9","m3","","11","","5"]
                string[2] = ["9","m3","","11","","5","","13","m7","","R","","9"]
                string[1] = ["","m7","","R","","9","m3","","11","","5","","13"]
                string[0] = ["","11","","5","","13","m7","","R","","9","m3",""]
                break
            default: break
            }
            break
        case 2:
            switch (Scale) {
            case 0: //Altered Scale
                string[5] = ["","","♭5","","#5/♭13","","m7","","R","♭9","","#9","M3"]
                string[4] = ["","R","♭9","","#9","M3","","♭5","","#5/♭13","","m7",""]
                string[3] = ["","♭13","","m7","","R","♭9","","#9","M3","","♭5",""]
                string[2] = ["","#9","M3","","♭5","","#5/♭13","","m7","","R","♭9",""]
                string[1] = ["","m7","","R","♭9","","#9","","11","♭5","","#5/♭13",""]
                string[0] = ["M3","","♭5","","#5/♭13","","m7","","R","♭9","","#9","M3"]
                break
            default: break
            }
            break
        default: break
        }
        changeKey(key: key)
        string = [string[5], string[4], string[3],string[2],string[1],string[0]]
        return string
    }
    
    func changeKey(key: Int) {
        for _ in 0 ..< key {
            for i in 0...5 {
                string[i].insert(string[i][11],at: 0)
                string[i].removeLast()
            }
        }
    }
}
