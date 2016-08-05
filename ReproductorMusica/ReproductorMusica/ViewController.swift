//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Mutlicanal3 on 5/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var iv_cover: UIImageView!
    @IBOutlet weak var tv_songs: UITableView!
    @IBOutlet weak var slider_volumen: UISlider!
    @IBOutlet weak var lb_volume: UILabel!
    @IBOutlet weak var lb_titulo: UILabel!
    
    var player = AVAudioPlayer()
    var songs : Array<Array<String>> = [["Hasta el amanecer - Nicky Jam", "Hasta_el_amanecer", ".mp3", "Hasta_el_amanecer.jpg"],
                                        ["La bicicleta - Carlos Vives & Shakira", "La_bicicleta", ".mp3", "La_bicicleta.jpeg"],
                                        ["El perdedor - Maluma", "El_perdedor", ".mp3", "El_perdedor.jpg"],
                                        ["Duele el corazon - Enrique Iglesias", "Duele_el_corazon", ".mp3", "Duele_el_corazon.jpg"],
                                        ["Bobo - J Balvin", "Bobo", ".mp3", "Bobo.jpg"]]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tv_songs.registerClass(UITableViewCell.self, forCellReuseIdentifier: "songCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Seleccionamos la canción por defecto
        self.selectSongManually(1)
        
        // Establecemos el volumen por defecto
        self.changeVolume(Float(0.5))
    }

    @IBAction func play()
    {
        player.prepareToPlay()
        if !player.playing {
            player.play()
        }
    }
    
    @IBAction func pause()
    {
        if player.playing {
            player.pause()
        }
    }
    
    @IBAction func stop()
    {
        if player.playing {
            player.stop()
            player.currentTime = 0.0
        }
    }
    
    @IBAction func volumeUp()
    {
        changeVolume(slider_volumen.value + 0.01)
    }
    
    @IBAction func volumeDown()
    {
        changeVolume(slider_volumen.value - 0.01)
    }
    
    @IBAction func shuffle()
    {
        let random = Int(arc4random_uniform(UInt32(songs.count)))
        self.selectSongManually(random)
    }
    
    @IBAction func sliderVolumeChange(sender: UISlider)
    {
        changeVolume(sender.value)
    }
    
    func selectSongManually(songNumber: Int)
    {
        // Seleccinamos la primera canción
        let rowToSelect:NSIndexPath = NSIndexPath(forRow: songNumber, inSection: 0)
        tv_songs.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None)
        self.tableView(tv_songs, didSelectRowAtIndexPath: rowToSelect)
    }
    
    func changeVolume(value: Float)
    {
        slider_volumen.setValue(value, animated: true)
        lb_volume.text = String.localizedStringWithFormat("%.0f", value * 100.0)
        player.volume = value
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = tv_songs.dequeueReusableCellWithIdentifier("songCell")! as UITableViewCell
        
        cell.textLabel?.textColor = UIColor.redColor()
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.text = songs[indexPath.row][0]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
        let sound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource(songs[indexPath.row][1], ofType: songs[indexPath.row][2])!)
        do {
            player = try AVAudioPlayer(contentsOfURL: sound)
            self.play()
        }
        catch {
            
        }
        iv_cover.image = UIImage(named: songs[indexPath.row][3])
        lb_titulo.text = (songs[indexPath.row][0] as String).stringByReplacingOccurrencesOfString(" - ", withString: "\n")
    }
}

