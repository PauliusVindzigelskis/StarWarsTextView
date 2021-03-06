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
        if self.textView.isCrawling
        {
            self.textView.stopCrawlingAnimation()
            sender.setTitle("ANIMATE", for: .normal)
        } else {
            self.textView.scrollToTop()
            self.textView.startCrawlingAnimation()
            sender.setTitle("STOP", for: .normal)
        }
    }
    
    func starWarsTextViewDidFinishScrolling(_ textView: StarWarsTextView) {
        self.dismiss(animated: true, completion: nil)
    }
}

