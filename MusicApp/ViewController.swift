//
//  ViewController.swift
//  MusicApp
//
//  Created by Andy Wu on 7/13/20.
//  Copyright © 2020 Andy Wu. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization{ (status) in 
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre:String){
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value:genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
//        applies filter of genre
        musicPlayer.setQueue(with:query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}

