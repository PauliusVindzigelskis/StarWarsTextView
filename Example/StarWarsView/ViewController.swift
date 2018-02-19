//
//  ViewController.swift
//  StarWarsView
//
//  Created by Vindzigelskis, Paulius on 2/16/18.
//  Copyright © 2018 New Guy Studio. All rights reserved.
//

import UIKit
import StarWarsTextView

class ViewController: UIViewController, StarWarsTextViewDelegate
{
    @IBOutlet var scrollButton: UIButton!
    @IBOutlet var textView: StarWarsTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.starWarsDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func animatePressed(_ sender: UIButton) {
        self.textView.scrollToTop()
        self.textView.animateScrolling()
        
        sender.isEnabled = false
    }
    
    func starWarsTextViewDidFinishScrolling(_ textView: StarWarsTextView) {
        self.dismiss(animated: true, completion: nil)
    }
}

