//
//  ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/5/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

   

    @IBOutlet weak var quejas: UIButton!
    
    @IBOutlet weak var consulta: UIButton!
  
   
    @IBOutlet weak var casosresueltos: UILabel!
    
    @IBOutlet weak var manualusuario: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        quejas.layer.cornerRadius = 20
        consulta.layer.cornerRadius = 20 //personaliza botones
        casosresueltos.text = "2"
  
    }
    
  


}

