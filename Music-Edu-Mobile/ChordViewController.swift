//
//  ViewController.swift
//  Music-Edu-Mobile
//
//  Created by Haru Toyama on 2021/10/12.
//　test

import UIKit

class ChordViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    var keyString : [String] = []
    var degree : [String] = []
    var root: [String] = [], third: [String] = [], fifth: [String] = [], seventh: [String] = []
    var Mode : Int = 0
    var key : Int = 0
    
    private let sideMargin: CGFloat = 0
    private let itemPerWidth: CGFloat = 9
    private let itemSpacing: CGFloat = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        switch (indexPath.section) {
        case 0:
            label.text = degree[indexPath.row]
            break
        case 1:
            label.text = root[indexPath.row]
            break
        case 2:
            label.text = third[indexPath.row]
            break
        case 3:
            label.text = fifth[indexPath.row]
            break
        case 4:
            label.text = seventh[indexPath.row]
            break
        default:
            label.text = keyString[indexPath.row]
            break
        }
        return cell
    }
    
    @IBOutlet weak var Key_Segment: UISegmentedControl!
    @IBAction func SetKey(_ sender: Any) {
        self.key = Key_Segment.selectedSegmentIndex
        let keyText : String = Key_Segment.titleForSegment(at: self.key)!
        print("Num: " + String(self.key) + " Key: " + keyText)
        self.setKey()
    }
    
    @IBOutlet weak var ModeSeg: UISegmentedControl!
    @IBAction func ModeSegAction(_ sender: Any) {
        self.Mode = ModeSeg.selectedSegmentIndex
        self.setKey()
    }
    
    @IBOutlet weak var chordTable: UICollectionView!

    
    override func viewDidLoad() {
        chordTable.delegate = self
        chordTable.dataSource = self
        chordTable.reloadData()
        
        let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 10,
                                                   left: sideMargin,
                                                   bottom: 10,
                                                   right: sideMargin)
        layout.minimumInteritemSpacing = itemSpacing
        chordTable.collectionViewLayout = layout
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setKey()
    }
    func setKey() {
        keyString = ["C", "C#/D♭", "D", "D#/E♭", "E","F","F#/G♭", "G","G#/A♭", "A", "A#/B♭", "B"]
        for _ in 0 ..< key {
            keyString.append(keyString[0])
            keyString.removeFirst()
        }
        if (self.Mode == 0) { //Major
            self.degree = ["Ⅰmaj7","Ⅱm7","Ⅲm7","Ⅳmaj7","Ⅴ7","Ⅵm7","Ⅶm7(♭5)"]
            self.root = [keyString[0],keyString[2],keyString[4],keyString[5],keyString[7],keyString[9],keyString[11]]
            self.third = [keyString[4],keyString[5],keyString[7],keyString[9],keyString[11],keyString[0],keyString[2]]
            self.fifth  = [keyString[7],keyString[9],keyString[11],keyString[0],keyString[2],keyString[4],keyString[5]]
            self.seventh = [keyString[11],keyString[0],keyString[2],keyString[4],keyString[5],keyString[7],keyString[9]]
        } else { //Minor
            self.degree = ["Ⅰm7","Ⅱm7(♭5)","Ⅲmaj7","Ⅳm7","Ⅴm7","Ⅵmaj7","Ⅶ7"]
            self.root = [keyString[0],keyString[2],keyString[3],keyString[5],keyString[7],keyString[8],keyString[10]]
            self.third = [keyString[3],keyString[5],keyString[7],keyString[8],keyString[10],keyString[0],keyString[2]]
            self.fifth  = [keyString[7],keyString[8],keyString[10],keyString[0],keyString[2],keyString[3],keyString[5]]
            self.seventh = [keyString[10],keyString[0],keyString[2],keyString[3],keyString[5],keyString[7],keyString[8]]
        }
        self.chordTable.reloadData()
    }
}

extension ChordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // セルの割当に利用可能なwidth
        // :親viewのwidth - 左右のマージン - セル間の水平方向の間隔 * (列数 - 1)
        let availableWidth = (view.frame.width - sideMargin * 2) - itemSpacing * (itemPerWidth - 1)

        // セル一つのwidth
        let width = availableWidth / itemPerWidth
        // heightを変更
        return CGSize(width: width, height: 22)
    }
}
