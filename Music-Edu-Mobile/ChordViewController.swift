//
//  ViewController.swift
//  Music-Edu-Mobile
//
//  Created by Haru Toyama on 2021/10/12.
//　test

import UIKit

class ChordViewController: UIViewController {
    @IBOutlet weak var Key_Segment: UISegmentedControl!
    @IBAction func SetKey(_ sender: Any) {
        let keyNum : Int = Key_Segment.selectedSegmentIndex
        let keyText : String = Key_Segment.titleForSegment(at: keyNum)!
        print("Num: " + String(keyNum) + " Key: " + keyText)
        
    }
    
    let key : [String] = ["C", "C#/D♭", "D", "D#/E♭", "E","F","F#/G♭", "G","G#/A♭", "A", "A#/B♭", "B"]
    
    override func viewDidLoad() {
        for (i,texts) in key.enumerated() {
            self.Key_Segment.setTitle(texts, forSegmentAt: i)
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

