//
//  Kahveler.swift
//  Starbucks App
//
//  Created by Enes Durmuşoğlu on 17.10.2023.
//

import Foundation

class Urunler {
    
    var id :Int?
    var ad: String?
    var resim : String?
    var fiyat : Double?
    
    init() {
        
    }
    
    init(id: Int, ad: String, resim: String, fiyat: Double) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
}
