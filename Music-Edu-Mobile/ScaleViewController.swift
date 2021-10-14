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
    var string6: [String] = ["","","","","","","","","","","","",""]
    var string5: [String] = ["","","","","","","","","","","","",""]
    var string4: [String] = ["","","","","","","","","","","","",""]
    var string3: [String] = ["","","","","","","","","","","","",""]
    var string2: [String] = ["","","","","","","","","","","","",""]
    var string1: [String] = ["","","","","","","","","","","","",""]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.textAlignment = .center
        switch (indexPath.section) {
        case 0:
            label.text = string6[indexPath.row]
            break
        case 1:
            label.text = string5[indexPath.row]
            break
        case 2:
            label.text = string4[indexPath.row]
            break
        case 3:
            label.text = string3[indexPath.row]
            break
        case 4:
            label.text = string2[indexPath.row]
            break
        case 5:
            label.text = string1[indexPath.row]
            break
        default:
            break
        }
        if self.traitCollection.userInterfaceStyle == .dark {
            cell.layer.borderColor = UIColor.white.cgColor
        } else {
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
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        self.string6 = string[0]
        self.string5 = string[1]
        self.string4 = string[2]
        self.string3 = string[3]
        self.string2 = string[4]
        self.string1 = string[5]
        board.delegate = self
        board.dataSource = self
        board.reloadData()
    }
}
