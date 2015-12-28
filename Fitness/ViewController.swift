//
//  ViewController.swift
//  Fitness
//
//  Created by 田磊 on 15/12/8.
//  Copyright © 2015年 田磊. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.locationManager.startUpdatingLocation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 100.0
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        
        self.mapView.delegate = self
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        
//        var geocoder = CLGeocoder()
//        
//        geocoder.geocodeAddressString("健身", completionHandler: {(placemarks,error)->Void in
//            for items in placemarks!{
//                NSLog("%s", items)
//            }
//        
//        })
    //self.mapView.addAnnotation(MKAnnotation)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var txtlng: UILabel!
    @IBOutlet weak var txtlat: UILabel!
    @IBOutlet weak var txtalt: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    
    var locationManager : CLLocationManager!
    
    
    @IBAction func startLocation(sender: AnyObject) {
        self.locationManager.startUpdatingLocation()
        NSLog("start Location")

    }

    @IBAction func stopLocation(sender: AnyObject) {
        self.locationManager.stopUpdatingLocation()
        NSLog("stop Location")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last! as CLLocation
        
       
        
        let ViewRegions = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 3000, 3000) // 设置当前坐标区域

        
        self.mapView.setRegion(ViewRegions, animated: true) //设置显示区域
        
        self.txtlng.text = NSString(format: "%3.5f", currentLocation.coordinate.longitude)         as String
        self.txtlat.text = NSString(format: "%3.5f", currentLocation.coordinate.latitude)         as String
        self.txtalt.text = NSString(format: "%3.5f米", currentLocation.altitude)
            as String
        
        
        
    }
    @IBAction func onCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            //创建图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //设置来源
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            //允许编辑
            picker.allowsEditing = true
            //打开相机
            self.presentViewController(picker, animated: true, completion: { () -> Void in
                
            })
        }else{
            print("找不到相机")
        }
    }
}

