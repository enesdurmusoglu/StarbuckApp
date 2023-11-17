//
//  DetaySayfa.swift
//  Starbucks App
//
//  Created by Enes Durmuşoğlu on 17.10.2023.
//

import UIKit

class DetaySayfa: UIViewController {
    
    var urun: Urunler?

    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    @IBOutlet weak var labelUrunAd: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = urun {
            
            labelUrunAd.text = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.fiyat!) ₺"
            
           
            

        }
    }
    
   
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        if let u = urun {
            print("Sepet : \(u.ad!) sepete eklendi ")
        }
    }
}
   

