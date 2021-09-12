//
//  Pantalla4ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/7/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit
import Firebase



class Pantalla4ViewController: UIViewController {
    
    var folioConsulta = ""

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var folio: UITextField!
    @IBOutlet weak var status: UITextView!
    @IBOutlet weak var observacion: UITextView!
    var ref = Database.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        boton1.layer.cornerRadius=9 //boton personalizado
      
    }
    

    @IBAction func action(_ sender: Any) {
        folioConsulta = folio.text!
        
        if !folioConsulta.isEmpty {
            
            self.ref.child("Quejas y Sugerencias/\(folioConsulta)/Status").getData { (error, snapshot) in
                if let error = error {
                    self.status.text = "Ocurrió un error: \(error)"
                }
                else if snapshot.exists() {
                    self.status.text = "\(snapshot.value!)"
                }
                else {
                    self.status.text = "No se encontró el folio"
                }
            }

            self.ref.child("Quejas y Sugerencias/\(folioConsulta)/Observacion").getData { (error, snapshot) in
                if let error = error {
                    self.observacion.text = "Ocurrió un error: \(error)"
                }
                else if snapshot.exists() {
                    self.observacion.text = "\(snapshot.value!)"
                }
                else {
                    self.observacion.text = " "
                }
            }

            //
        }else{
            status.text = "Escribe el folio a consultar"
        }
        }
    }
    


