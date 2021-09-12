//
//  ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/5/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

   

    @IBOutlet weak var quejas: UIButton!
    @IBOutlet weak var consulta: UIButton!
    @IBOutlet weak var casosresueltos: UILabel!
    @IBOutlet weak var manualusuario: UIButton!
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        quejas.layer.cornerRadius = 20
        consulta.layer.cornerRadius = 20 //personaliza botones
        
        let query = ref.child("Quejas y Sugerencias").queryOrdered(byChild: "Status").queryStarting(atValue: "Resuelto")

                query.observeSingleEvent(of: .value) { (snapshot) in
                    guard snapshot.exists() != false else { return }
                    let casosR = snapshot.childrenCount
                    self.casosresueltos.text = "\(casosR)"
                    
                }
        
                     
        
    }
    
  


}

