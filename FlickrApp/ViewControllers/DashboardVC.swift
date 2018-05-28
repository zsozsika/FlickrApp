//
//  DashboardVC.swift
//  FlickrApp
//
//  Created by Kovács Zsóka on 2018. 05. 22..
//  Copyright © 2018. Kovács Zsóka. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import AlamofireImage
import CoreImage

class DashboardVC: UIViewController {
    @IBOutlet weak var collage: UIImageView!
    
    var collageImage = UIImage()
    
    var imageUrlArray = [String]()
    var imageArray = [UIImage]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageUrlArray = []
        imageArray = []
        retrieveUrls { (finished) in
            if finished {
                self.retrieveImages { (finished) in
                    if finished {
                        print(self.imageUrlArray[0])
                        print(self.imageUrlArray.count)
                        self.collageImage = CIImage.collageImage(rect: CGRect(origin: CGPoint(x: 8, y: 150), size: CGSize(width: 100, height: 200)), images: self.imageArray)
                        self.collage.image = self.collageImage
                        self.collageImage.add(to: self.collage)
                    }
                }
            }
        }
        
        //CIImage.collageImage(rect: CGRect(origin: CGPoint(x: 8, y: 150), size: CGSize(width: 100, height: 200)), images: imageArray)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func flickUrl(forApiKey key: String, andNumberOfPhotos number: Int) -> String {
        let url =  "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=\(apiKey)&per_page=\(number)&format=json&nojsoncallback=1"
        return url
    }
    
    func retrieveUrls(handler: @escaping (_ status: Bool) -> ()) {
        Alamofire.request(flickUrl(forApiKey: apiKey, andNumberOfPhotos: 10)).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
            let photosDict = json["photos"] as! Dictionary<String, AnyObject>
            let photosDictArray = photosDict["photo"] as! [Dictionary<String, AnyObject>]
            for photo in photosDictArray {
                let postUrl = "https://farm\(photo["farm"]!).staticflickr.com/\(photo["server"]!)/\(photo["id"]!)_\(photo["secret"]!)_h_d.jpg"
                self.imageUrlArray.append(postUrl)
            }
            handler(true)
        }
    }
    
    func retrieveImages(handler: @escaping (_ status: Bool) -> ()) {
        for url in imageUrlArray {
            Alamofire.request(url).responseImage(completionHandler: { (response) in
                guard let image = response.result.value else { return }
                self.imageArray.append(image)
                if self.imageArray.count == self.imageUrlArray.count {
                    handler(true)
                }
            })
        }
    }
    
    
}
