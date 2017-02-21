//
//  ViewController.swift
//  CapitalCities
//
//  Created by Dan Lindsay on 2017-02-21.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController, MKMapViewDelegate {
    
    
    @IBOutlet var questionLabel: NSTextField!
    @IBOutlet var scoreLabel: NSTextField!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = NSClickGestureRecognizer(target: self, action: #selector(mapClicked))
        mapView.addGestureRecognizer(recognizer)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func mapClicked(recognizer: NSClickGestureRecognizer) {
        
        let location = recognizer.location(in: mapView)
        let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
        addPin(at: coordinates)
    }
    
    func addPin(at coord: CLLocationCoordinate2D) {
        
        let guess = Pin(title: "Your guess", coordinate: coord, color: NSColor.red)
        mapView.addAnnotation(guess)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //convert the annotation to a pin so we can read its color
        guard let pin = annotation as? Pin else { return nil }
        
        //create an identifier string that will be used to share map pins
        let identifier = "Guess"
        
        //attempt to dequeue a pin from the re-use queue
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            //there was no pin to re-use. Create a new one
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        } else {
            // we got back a pin to re-use, so update its annotation to the new annotation
            annotationView?.annotation = annotation
        }
        
        //customize the pin so that it can show a call out and has a color
        annotationView?.canShowCallout = true
        annotationView?.pinTintColor = pin.color
        
        return annotationView
    }


}












