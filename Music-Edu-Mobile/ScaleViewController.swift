//
//  ScaleViewController.swift
//  Music-Edu-Mobile
//
//  Created by Haru Toyama on 2021/10/12.
//

import UIKit
import SwiftUI

class ScaleViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    var mode : Int = 0
    var scaleInt : Int = 0
    var keyInt : Int = 0
    var strings: [[String]]  = [[],[],[],[],[],[]]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.textAlignment = .center
        label.text = strings[indexPath.section][indexPath.row]
        
        if self.traitCollection.userInterfaceStyle == .dark {
            if (strings[indexPath.section][indexPath.row] == "R") {
                label.textColor = .red
            } else {
                label.textColor = .white
            }
            cell.layer.borderColor = UIColor.white.cgColor
        } else {
            if (strings[indexPath.section][indexPath.row] == "R") {
                label.textColor = .red
            } else {
                label.textColor = .black
            }
            cell.layer.borderColor = UIColor.black.cgColor
            
        }
        cell.layer.borderWidth = 1
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 6
    }
    
   

    @IBOutlet weak var board: UICollectionView!
    @IBOutlet weak var Key: UISegmentedControl!
    @IBOutlet weak var modeSeg: UISegmentedControl!
    @IBAction func majorMinorAction(_ sender: Any) {
        self.mode = modeSeg.selectedSegmentIndex
        self.menuConfiguration()
        self.scaleInt = 0
        self.fingerBoardUpdate()
    }
    @IBAction func Key_Action(_ sender: Any) {
        self.keyInt = Key.selectedSegmentIndex
        self.fingerBoardUpdate()
    }
    @IBOutlet weak var chooseScale: UIButton!
    @IBAction func chooseScaleAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        board.layer.borderWidth = 1
        menuConfiguration()
        chooseScale.showsMenuAsPrimaryAction = true
        for i in 0...5 {
            self.strings[i].append(contentsOf: Array(repeating: "", count: 13))
        }
        super.viewDidLoad()
    }
    
    func menuConfiguration() {
        var menu = UIMenu(title: "menu", children: [])
        switch mode {
        case 0: //Major
            let natrual = UIAction(title: "Natural Scale", image: nil) { _ in self.scaleInt = 0
                self.fingerBoardUpdate()
            }
            let pentatonic = UIAction(title: "Pentatonic Scale", image: nil) { _ in self.scaleInt = 1
                self.fingerBoardUpdate()
            }
            menu = UIMenu(title: "Scale", children: [natrual,pentatonic])
            break
        case 1: //Minor
            let natrual = UIAction(title: "Natural Scale", image: nil) { _ in self.scaleInt = 0
                self.fingerBoardUpdate()
            }
            let pentatonic = UIAction(title: "Pentatonic Scale", image: nil) { _ in  self.scaleInt = 1
                self.fingerBoardUpdate()
            }
            let dorian = UIAction(title: "Dorian Scale", image: nil) { _ in self.scaleInt = 2
                self.fingerBoardUpdate()
            }
            menu = UIMenu(title: "Scale", children: [natrual,pentatonic,dorian])
            break
        case 2: //Other
            let altered = UIAction(title: "Altered Scale", image: nil) { _ in self.scaleInt = 0
                self.fingerBoardUpdate()
            }
            menu = UIMenu(title: "Scale", children: [altered])
            break
        default: break
        }
        
        chooseScale.menu = menu
    }
    
    func fingerBoardUpdate(){
        let string: [[String]] = fingerBoard().getInfo(key: self.keyInt, mode: self.mode, Scale: self.scaleInt)
        self.strings = [string[0],string[1],string[2],string[3],string[4],string[5]]
        board.delegate = self
        board.dataSource = self
        board.reloadData()
    }
}
