//
//  ViewController.swift
//  CapitalCities
//
//  Created by Dan Lindsay on 2017-02-21.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController {
    
    
    @IBOutlet var questionLabel: NSTextField!
    @IBOutlet var scoreLabel: NSTextField!
    @IBOutlet var mapKit: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

