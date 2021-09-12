//
//  Pantalla3ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/6/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit

class Pantalla3ViewController: UIViewController {
   
    @IBOutlet weak var boton1: UIButton!//boton de inicio
    @IBOutlet weak var label: UILabel!//label del folio
    var folio = String()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boton1.layer.cornerRadius = 9 //redondea boton
        navigationItem.hidesBackButton = true
        
        
            label.text = folio
        
        //se asignan a label los datos que recibio de la pantalla anterior y se reflejan
      //  motivo.text = motivos
        //asunto.text = asuntos
        //texto.text = textos
        //correo.text! = correos
        
    }
    

    @IBAction func boton3(_ sender: Any) {//boton que manda a inicio
        UIPasteboard.general.string = label.text//copia el folio
        
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "inicio")
       self.navigationController?.pushViewController(vc, animated: true)
        
    }
        
    
    
}

