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
    var folio3 = String()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boton1.layer.cornerRadius = 9 //redondea boton
        navigationItem.hidesBackButton = true
        
        
        label.text = folio3
        
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
       self.showToast12(message: "Folio copiado", font: .systemFont(ofSize: 12.0))
    }
        
    
    
}

extension UIViewController {

func showToast12(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
