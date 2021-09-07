//
//  Pantalla2ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/6/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit
import Firebase

var ref: DatabaseReference!


class Pantalla2ViewController: UIViewController {
    //variables para guardar los datos que se ingresen
    var motivo1 = ""
    var asunto1 = ""
    var correo = ""
    var contenido = ""
    var ref = Database.database().reference()

    
    

   //dropdown de Motivo
   @IBOutlet weak var botonSeleccion: UIButton!//boton verde deldropdown
   @IBOutlet var botonQuejaSugerencia: [UIButton]!//opciones del dropdown
    //dropdown de Asunto
    @IBOutlet weak var botonSeleccion2: UIButton!//boton verde del dropdown
    @IBOutlet var botonAsunto: [UIButton]!//opciones del dropdown
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var folioF: UILabel!
    
    
  
    
    
    @IBOutlet weak var txtview: UITextView!//texto donde se ingresa la queja o sugerencia
    @IBOutlet weak var correo1: UITextField!//texto donde se ingresa el correo
    @IBOutlet weak var envio: UIButton!//boton de enviar
    @IBOutlet weak var pruebas: UITextField!//campo de texto de "otro"
    
    // var motivos = ["Queja", "Sugerencia"]
     //var asuntos = ["Administrativos", "Maestros", "Mantenimiento", "Plataformas", "Otro"]
    //var asuntos = [String]()
          
   
    override func viewDidLoad() {
        super.viewDidLoad()
       // botonSeleccion.isHidden = true
        //botonSeleccion2.isHidden = true
        //navigationItem.hidesBackButton = true
         pruebas.layer.cornerRadius = 9
         txtview.layer.cornerRadius = 9
         correo1.layer.cornerRadius = 9
         envio.layer.cornerRadius = 9   //personaliza elementos en el view
         pruebas.visibility = .gone
        
        
        //boton motivo
         botonSeleccion.layer.cornerRadius = 6
               botonQuejaSugerencia.forEach({
                   (btn) in
                   btn.layer.cornerRadius = 6
                   btn.isHidden = true//oculta las opciones de motivo
                   btn.alpha = 0
               })
        
        //boton asunto
        botonSeleccion2.layer.cornerRadius = 6
                     botonAsunto.forEach({
                         (btn) in
                         btn.layer.cornerRadius = 6
                         btn.isHidden = true//oculta las opciones de asunto
                         btn.alpha = 0
                     })
      
        
        
    }
    
    
  
     
    @IBAction func btnMotivo2(_ sender: UIButton) {//despliega el dropdown motivo
        if let btnLabel1 = sender.titleLabel?.text {
            if btnLabel1 == "Selecciona el motivo" {
                botonSeleccion.titleLabel?.text = btnLabel1
                label.text = btnLabel1
                motivo1 = btnLabel1
            }
        }
        
        botonQuejaSugerencia.forEach { (btn) in
               UIView.animate(withDuration: 0.4) {
                   btn.isHidden = !btn.isHidden
                   btn.alpha = btn.alpha == 0 ? 1 : 0
                  btn.layoutIfNeeded()
               }
           }
       }
       
       @IBAction func btnQuejaSugerencia(_ sender: UIButton) {//inicio boton selecciona motivo
           
           if let btnLabel = sender.titleLabel?.text{//mando llamar lo que dice las opciones, queja o sugerencia y da las incstrucciones
               
               //accion con las opciones
           if btnLabel == "Queja"{//se refleja en el boton verde la opcion seleccionada
                botonSeleccion.titleLabel?.text = btnLabel
                motivo1 = btnLabel//asigna el nombre del motivo a la variable
               }else if btnLabel == "Sugerencia"{
                   botonSeleccion.titleLabel?.text = btnLabel
               motivo1 = btnLabel
               }
               
           }
           
           botonQuejaSugerencia.forEach { (btn) in//cierra las opciones del menu al seleccionar una
               UIView.animate(withDuration: 0.4) {
                   btn.isHidden = true
                   btn.alpha = btn.alpha == 0 ? 1 : 0
                   btn.layoutIfNeeded()            }
           }
       }//fin boton o dropdown de selecciona motivo
       
       
      
       @IBAction func btnAsunto(_ sender: UIButton) {//despliega el dropdown asunto
        if let btnLabel3 = sender.titleLabel?.text {
            if btnLabel3 == "Selecciona el asunto"{
                label.text = btnLabel3
                asunto1 = btnLabel3
            }
        }
           
           botonAsunto.forEach { (btn) in
               UIView.animate(withDuration: 0.4) {
                   btn.isHidden = !btn.isHidden
                   btn.alpha = btn.alpha == 0 ? 1 : 0
                   btn.layoutIfNeeded()
               }
           }
       }
       
       @IBAction func btnSeleccionAsunto(_ sender: UIButton) {//inicio boton selecciona asunto
           if let btnLabel = sender.titleLabel?.text{//mando llamar lo que dice las opciones
               
            //  accion con las opciones
           if btnLabel == "Administrativos"{
                botonSeleccion2.titleLabel?.text = btnLabel//se refleja en el boton verde la opcion seleccionada
               pruebas.text = ""
               pruebas.visibility = .gone
               asunto1 = btnLabel//asigna el nombre del asunto a la variable
               } else if btnLabel == "Profesores"{
                   botonSeleccion2.titleLabel?.text = btnLabel
               pruebas.text = ""
               pruebas.visibility = .gone
               asunto1 = btnLabel
               } else if btnLabel == "Mantenimiento"{
                   botonSeleccion2.titleLabel?.text = btnLabel
               pruebas.text = ""
               pruebas.visibility = .gone
               asunto1 = btnLabel
                  }else if btnLabel == "Plataformas"{
                   botonSeleccion2.titleLabel?.text = btnLabel
               pruebas.text = ""
               pruebas.visibility = .gone
              asunto1 = btnLabel
                  }else if btnLabel == "Otro"{
                   botonSeleccion2.titleLabel?.text = btnLabel
                   pruebas.visibility = .visible
              asunto1 = btnLabel
           }
           
           
           }
           
           
           botonAsunto.forEach { (btn) in //oculta las opciones despues de seleccionar
               UIView.animate(withDuration: 0.4) {
                  btn.isHidden = !btn.isHidden
                   btn.alpha = btn.alpha == 0 ? 1 : 0
                   btn.layoutIfNeeded()
               }
           }
           
           
        
           
           
      }//fin boton selecciona asunto

 
    
  
    
    
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }//oculta teclado
    
    //acciones del boton de enviar
    @IBAction func enviar(_ sender: Any) {
        contenido = txtview.text!//asigna el comentario del alumno a la variable
        correo = correo1.text!//asigna el correo del alumno a la variable
        
        if asunto1 == "Selecciona el asunto" || motivo1 == "Selecciona el motivo" || contenido == "" {
            label.text = "No dejes campos vacios"
        
        }else if asunto1 == "Otro" && pruebas.text == ""{
            label.text = "No dejes campos vacios"
        }
        else {
            // obtener la fecha actual
            
            let now = Date()

            let formatter = DateFormatter()

            formatter.timeZone = TimeZone.current

            formatter.dateFormat = "dd/MM/yyyy"

            let date = formatter.string(from: now)
            //guarda la fecha actual en el formado dd/mes/año
            
            //letra aleatoria para folio
            let rLetter = "QWERTYUIOPLKJHGFDSAZXCVBNM"
            
            var f1 = ""
            for _ in 0 ..< 1 {
                    f1.append(rLetter.randomElement()!)
                }
            //fin letra aleatoria para folio
            self.ref.child("Quejas y Sugerencias").getData { (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }else{
                    var count = snapshot.childrenCount
                    count = count + 1
                    print(count)
                    
                }
            }
            
            let f2 = motivo1.prefix(1) // obtiene la primera letra del motivo
            let f4 = asunto1.prefix(2) // obtiene las primeras dos letras del asunto
            let folio = (f1 + f2 + f4).uppercased() //convierte todo el folio en mayusculas
            
            
            //GUARDA LOS DATOS EN LA BASE DE DATOS
            self.ref.child("Quejas y Sugerencias/\(folio)/Asunto").setValue(asunto1)
            self.ref.child("Quejas y Sugerencias/\(folio)/Categoria").setValue(motivo1)
            self.ref.child("Quejas y Sugerencias/\(folio)/Comentario").setValue(contenido)
            if !correo.isEmpty { //si hay un valor en correo, lo guarda
                self.ref.child("Quejas y Sugerencias/\(folio)/Correo").setValue(correo)
            }
            self.ref.child("Quejas y Sugerencias/\(folio)/Fecha").setValue(date)
            self.ref.child("Quejas y Sugerencias/\(folio)/Status").setValue("Pendiente, sin leer")
            // FIN GUARDADO DE DATOS

            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "folio")
            self.navigationController?.pushViewController(vc, animated: true)
            
            label.text = "Hola"
        }
    }
     

    
    
    
}










extension UIView {//codigo para el gone del campo de texto "otro"

    enum Visibility {
        case visible
        case invisible
        case gone
    }

    var visibility: Visibility {
        get {
            let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
            if let constraint = constraint, constraint.isActive {
                return .gone
            } else {
                return self.isHidden ? .invisible : .visible
            }
        }
        set {
            if self.visibility != newValue {
                self.setVisibility(newValue)
            }
        }
    }

    private func setVisibility(_ visibility: Visibility) {
        let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)

        switch visibility {
        case .visible:
            constraint?.isActive = false
            self.isHidden = false
            break
        case .invisible:
            constraint?.isActive = false
            self.isHidden = true
            break
        case .gone:
            if let constraint = constraint {
                constraint.isActive = true
            } else {
                let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
                self.addConstraint(constraint)
                constraint.isActive = true
            }
        }
    }
}





