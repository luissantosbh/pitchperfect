//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Luís Antônio de Oliveira Santos on 23/02/2018.
//  Copyright © 2018 Luís Antônio de Oliveira Santos. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
   
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    
    
    // MARK: TAG : ir no inspetor de atributos e mudar a Tag para cada botão. O slow = 0, fast = 1, chipmunk = 2 etc etc
    
    enum ButtonType: Int {case slow = 0, fast, chipmunk, vader, echo, reverb}
 
    
    // MARK: Função tocar o som
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) /*converte a TAG para ButtonType*/{
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed (_ sender: AnyObject){
       stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        setupAudio()
    }
    
    
    /* MARK: Revisão: Ajusta o contentMode da imageView do botão com o intuito de manter as proporções à medida que o botão tem seu tamanho alterado*/
        
    private func configureButtons(){
        configure(button: snailButton)
        configure(button: chipmunkButton)
        configure(button: rabbitButton)
        configure(button: vaderButton)
        configure(button: echoButton)
        configure(button: reverbButton)
    }
    
    private func configure(button: UIButton){
        button.imageView?.contentMode = .scaleAspectFit
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
