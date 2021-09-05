//
//  Pantalla4ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/7/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit

class Pantalla4ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boton1.layer.cornerRadius=9 //boton personalizado
      
    }
    

    @IBAction func action(_ sender: Any) {
        textview.text = "Hola, gracias por tu comentario, si van a tener acto academico"
    }
    

}
