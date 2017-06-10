//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Kevin on 2017-05-14.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/B7xai5u_tnk/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=67&sigh=1rf6nRTh2_-D07Jw3QX6NYI_LY", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/B7xai5u_tnk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "TheFatRat - Monody")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/n8X9_MgEdCg/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&sigh=LsGZRh7Vkfjp7pMSPLYPrBKExSY", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/n8X9_MgEdCg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "TheFatRat - Unity")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/3fxq7kqyWO8/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=67&sigh=h_wu-WB2T3L9A7ht0Zx0F2pfRGY", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3fxq7kqyWO8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "TheFatRat - TimeLapse")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/2Ax_EIb1zks/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=5DdRtnO_Zho96sUCpcb8p_vWO78", videoURL:"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/2Ax_EIb1zks\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "TheFatRat - Xenogenesis")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/KR-eV7fHNbM/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=67&sigh=xsvQtijr9Pyq3-Tzqm8BFBf0p_E", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KR-eV7fHNbM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "TheFatRat - The Calling")
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

