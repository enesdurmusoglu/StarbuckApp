//
//  ViewController.swift
//  Starbucks App
//
//  Created by Enes Durmuşoğlu on 17.10.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        urunlerTableView.dataSource = self
        urunlerTableView.delegate = self
       
        
        let u1 = Urunler(id: 1, ad: "Pumpkin Frappuccino", resim: "s1", fiyat: 89.99)
        let u2 = Urunler(id: 2, ad: "Salted Cold Brew", resim: "s2", fiyat: 89.99)
        let u3 = Urunler(id: 3, ad: "Strawberries Frappuccino ", resim: "s5", fiyat: 99.99)
        let u4 = Urunler(id: 4, ad: "Caramel Frappuccino", resim: "s6", fiyat: 89.99)
        let u5 = Urunler(id: 5, ad: "Berry Hibiscus", resim: "s3", fiyat: 89.99)
        let u6 = Urunler(id: 6, ad: "Cool Lime", resim: "s4", fiyat: 89.99)
        let u7 = Urunler(id: 7, ad: "Kremalı Havuçlu Kek", resim: "s7", fiyat: 69.99)
        let u8 = Urunler(id: 8, ad: "Kahveli Pasta", resim: "s8", fiyat: 69.99)
        let u9 = Urunler(id: 9, ad: "Belçika Çikolatalı Pasta", resim: "s9", fiyat: 79.99)
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        urunlerListesi.append(u8)
        urunlerListesi.append(u9)
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        

           
        }

    

    }







extension Anasayfa: UITableViewDelegate, UITableViewDataSource, HucreProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text = "\(urun.fiyat!)₺"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaplan.layer.cornerRadius = 10
        
        hucre.selectionStyle = .none
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            contextualAction,view,bool in
            print("\(urun.ad!) Ürün Silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            contextualAction, view, bool in
            print("\(urun.ad!) ürün düzenle")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun = sender as? Urunler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
                
            
            }
        }
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete eklendi")
    }
}

/*extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return urunlerListesi.count
 }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let urun = urunlerListesi[indexPath.row]
 
 let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
 
 
 }
 }
 
 
 /*extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return urunlerListesi.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let urun = urunlerListesi[indexPath.row]
  
  let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
  
  hucre.imageViewUrun.image = UIImage(named: urun.resim!)
  hucre.labelUrunAd.text = urun.ad
  hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
  
  return hucre
  }
  }
  
  
  /*extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return urunlerListesi.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let urun = urunlerListesi[indexPath.row]
   
   let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
   
   hucre.imageViewUrun.image = UIImage(named: urun.resim!)
   hucre.labelUrunAd.text = urun.ad
   hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
   
   return hucre
   }
   }
   
   
   /*extension Anasayfa : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let urun = urunlerListesi[indexPath.row]
    
    let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
    
    hucre.imageViewUrun.image = UIImage(named: urun.resim!)
    hucre.labelUrunAd.text = urun.ad
    hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
    
    return hucre
    }
    }
    
    
    
    
    /*extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return urunlerListesi.count // kaç tane satır sayısı olduğunu belirttik
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let urun = urunlerListesi[indexPath.row] // ürünlerin satırlarını bize getiriyor.
     
     //Hücrelerinizin kimlik (identifier) değerini belirttiğinizden emin olun ki doğru hücreleri tekrar kullanabilesiniz
     let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
     
     hucre.imageViewUrun.image = UIImage(named: urun.resim!)
     hucre.labelUrunAd.text = urun.ad
     hucre.labelUrunFiyat.text = "\(urun.fiyat!)"
     
     return hucre
     }
     
     
     }
     
     
     
     /*extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return urunlerListesi.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let urun = urunlerListesi[indexPath.row]
      
      let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
      
      hucre.imageViewUrun.image = UIImage(named: urun.resim!)
      hucre.labelUrunAd.text = urun.ad
      hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
      
      
      return hucre
      }
      }
      */
     */
    */
   */
  */
 */






