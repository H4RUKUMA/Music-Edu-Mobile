//
//  FingerBoard.swift
//  Music-Edu-Mobile
//
//  Created by Haru Toyama on 2021/10/13.
//

import Foundation

class fingerBoard {
    var string6: [String] = []
    var string5: [String] = []
    var string4: [String] = []
    var string3: [String] = []
    var string2: [String] = []
    var string1: [String] = []
    
    func getInfo(key: Int, majorOrMinor: Int, Scale: Int) -> [[String]] {
        print("key: " + String(key) + " m/M: " + String(majorOrMinor) + " Scale: " + String(Scale))
        var string: [[String]] = [[]]
        switch (majorOrMinor) {
        case 0:
            switch (Scale) {
            case 0: //Natrual Major
                string6 = ["M3","11","","5","","13","","M7","R","","9","","M3"]
                string5 = ["M7","R","","9","","M3","11","","5","","13","","M7"]
                string4 = ["5","","13","","M7","R","","9","","M3","11","","5"]
                string3 = ["9","","M3","11","","5","","13","","M7","R","","9"]
                string2 = ["13","","M7","R","","9","","M3","11","","5","","13"]
                string1 = ["M3","11","","5","","13","","M7","R","","9","","M3"]
                break
            case 1: //Major Pentatonic
                string6 = ["M3","","","5","","13","","","R","","9","","M3"]
                string5 = ["","R","","9","","M3","","","5","","13","",""]
                string4 = ["5","","13","","","R","","9","","M3","","","5"]
                string3 = ["9","","M3","","","5","","13","","","R","","9"]
                string2 = ["13","","","R","","9","","M3","","","5","","13"]
                string1 = ["M3","","","5","","13","","","R","","9","","M3"]
                break
            default: break
            }
            break
        case 1:
            switch (Scale) {
            case 0: //Natrual Minor
                string6 = ["","11","","5","♭13","","m7","","R","","9","m3",""]
                string5 = ["","R","","9","m3","","11","","5","♭13","","m7",""]
                string4 = ["5","♭13","","m7","","R","","9","m3","","11","","5"]
                string3 = ["9","m3","","11","","5","♭13","","m7","","R","","9"]
                string2 = ["","m7","","R","","9","m3","","11","","5","♭13",""]
                string1 = ["","11","","5","♭13","","m7","","R","","9","m3",""]
                break
            case 1: //Minor Pentatonic
                string6 = ["","11","","5","","","m7","","R","","","m3",""]
                string5 = ["","R","","","m3","","11","","5","","","m7",""]
                string4 = ["5","","","m7","","R","","","m3","","11","","5"]
                string3 = ["","m3","","11","","5","","","m7","","R","",""]
                string2 = ["","m7","","R","","","m3","","11","","5","",""]
                string1 = ["","11","","5","","","m7","","R","","","m3",""]
                break
            case 2: //Dorian
                string6 = ["","11","","5","","13","m7","","R","","9","m3",""]
                string5 = ["","R","","9","m3","","11","","5","","13","m7",""]
                string4 = ["5","","13","m7","","R","","9","m3","","11","","5"]
                string3 = ["9","m3","","11","","5","","13","m7","","R","","9"]
                string2 = ["","m7","","R","","9","m3","","11","","5","","13"]
                string1 = ["","11","","5","","13","m7","","R","","9","m3",""]
                break
            default: break
            }
            break
        default: break
        }
        changeKey(key: key)
        string = [string6, string5, string4,string3,string2,string1]
        return string
    }
    
    func changeKey(key: Int) {
        for j in 0 ..< key {
            string6.insert(string6[11], at: 0)
            string6.removeLast()
            string5.insert(string5[11], at: 0)
            string5.removeLast()
            string4.insert(string4[11], at: 0)
            string4.removeLast()
            string3.insert(string3[11], at: 0)
            string3.removeLast()
            string2.insert(string2[11], at: 0)
            string2.removeLast()
            string1.insert(string1[11], at: 0)
            string1.removeLast()
        }
    }
}
