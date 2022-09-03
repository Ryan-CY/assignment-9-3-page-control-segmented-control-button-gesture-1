//
//  ViewController.swift
//  assignment 9-3 page control，segmented control，button & gesture
//
//  Created by Ryan Lin on 2022/9/2.
//

import UIKit

class ViewController: UIViewController {
    //在pics的陣列裡，直接輸入已存進Assets裡的圖片名稱，所以要加雙引號
    let pics = ["RavenclawCrest","GryffindorCrest","SlytherinCrest","HufflepuffCrest"]
    let labels = ["雷文克勞 Ravenclaw","葛萊分多 Gryffindor","史萊哲林 Slytherin","赫夫帕夫 Hufflepuff"]
    let introductions = ["霍格華茲魔法與巫術學院的四個學院之一，由羅威娜·雷文克勞創建。這個學院的成員以智慧、學識與才智著稱。學院的代表色是藍和青銅，代表動物是鷹。雷文克勞的幽靈灰衣貴婦在生前是羅威娜·雷文克勞的女兒。從這個學院中走出過許多很偉大的男巫和女巫，包括菲留斯·孚立維、加里克·奧利凡德和露娜·羅古德。","葛萊分多學院 (Gryffindor)是由高錐客·葛萊分多創辦的學院，也是霍格華茲魔法與巫術學院的四個學院之一。它的代表動物是獅子，代表色是紅和金。麥米奈娃是已知最近的學院院長。尼古拉斯·德·敏西-波平頓爵士，也叫「差點沒頭的尼克」，是葛萊分多學院的幽靈。具有勇氣、仗義與意志的學生會被分進葛萊分多學院。","霍格華茲魔法與巫術學院的四個學院之一，它的學生通常都表現出精明、機智和野心等特徵。史萊哲林的代表動物是蛇，代表色是綠和銀。史萊哲林學院的幽靈是血腥男爵。這個學院由薩拉札·史萊哲林創辦，招收的學生大多是純種，這是因為學院的創辦者不信任麻瓜出身的男巫和女巫。史萊哲林學院的名聲不是很好，因為英國的大部分黑巫師都出自這裡，比如湯姆·魔佛羅·瑞斗，即後來的佛地魔。食死人中的大部分也是從史萊哲林學院走出的。它們的傳統對手是葛萊分多學院。","霍格華茲魔法與巫術學院的四個學院之一。這個學院的創辦者是中世紀的女巫海加·赫夫帕夫。目前，赫夫帕夫學院的院長是帕莫娜·芽菜。胖修士是這個學院的幽靈。赫夫帕夫是所有學院中最包容的學院。他們更加看重成員的努力、容忍、忠誠和公平競爭，而非他們的特質。赫夫帕夫的代表動物是獾，代表色是黃和黑。"]
    
    
    
    //為下面的button設定一個基準點，從array的第一個開始，所以等於0
    var index = 0
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var LabelChange: UILabel!
    
    @IBOutlet weak var introChange: UITextView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //設定下一張的button
    @IBAction func next(_ sender: Any) {
        //使影像往後跑，將index+1除以照片張數的餘數存入index
        index = (index + 1) % pics.count
        let name = pics[index]
        imageView.image = UIImage(named: pics[index])
        print(index, name)
        //把 labels 的 index 存入LabelChange的顯示文字
        LabelChange.text = labels[index]
        //把 introductions 的 index 存入LabelChange的顯示文字
        introChange.text = introductions[index]
        //把index存入pageControl的currentPage，產生連動
        pageControl.currentPage = index
        //把index存入分頁控制的selectedSegmentIndex，產生連動
        segmentedControl.selectedSegmentIndex = index
        
    }
    
    //設定上一張的button
    @IBAction func pre(_ sender: Any) {
        //使影像往後跑，算式使index不會少於0
        index = (index + pics.count - 1) % pics.count
        let name = pics[index]
        imageView.image = UIImage(named: pics[index])
        print(index, name)
        LabelChange.text = labels[index]
        introChange.text = introductions[index]
        pageControl.currentPage = index
        segmentedControl.selectedSegmentIndex = index
        
    }
    
    
    @IBAction func pageSwitch(_ sender: UIPageControl) {
        index = sender.currentPage
        let name = pics[index]
        imageView.image = UIImage(named: pics[index])
        print(sender.currentPage)
        LabelChange.text = labels[index]
        introChange.text = introductions[index]
        segmentedControl.selectedSegmentIndex = index
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        
        index = sender.selectedSegmentIndex
        let name = pics[index]
        imageView.image = UIImage(named: pics[index])
        print(sender.selectedSegmentIndex)
        LabelChange.text = labels[index]
        introChange.text = introductions[index]
        pageControl.currentPage = index
    }
    
  
}

