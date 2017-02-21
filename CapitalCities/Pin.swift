//
//  Pin.swift
//  CapitalCities
//
//  Created by Dan Lindsay on 2017-02-21.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Cocoa
import MapKit

class Pin: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var color: NSColor
    
    init(title: String, coordinate: CLLocationCoordinate2D, color: NSColor = NSColor.green) {
        self.title = title
        self.coordinate = coordinate
        self.color = color
    }
    
}
