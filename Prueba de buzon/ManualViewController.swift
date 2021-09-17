//
//  ManualViewController.swift
//  BuzondeMejora
//
//  Created by Susana Murillo on 17/09/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit
import PDFKit

class ManualViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add PDFView to view controller.
        let pdfView = PDFView(frame: self.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(pdfView)
        
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical
        
        
        // Fit content in PDFView.
        pdfView.autoScales = true
        
        // Load Sample.pdf file from app bundle.
        let fileURL = Bundle.main.url(forResource: "manual_iOS", withExtension: "pdf")
        pdfView.document = PDFDocument(url: fileURL!)
    }
    

  

}
