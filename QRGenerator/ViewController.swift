//
//  ViewController.swift
//  QRGenerator
//
//  Created by Jose Pino on 28/12/17.
//  Copyright © 2017 Jose Pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var codeSelector: UISegmentedControl!
    @IBOutlet weak var displayCodeView: UIImageView!
    
    var filter:CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



    @IBAction func generatePressed(_ sender: UIButton) {
        if let text = dataField.text {  // Si tenemos texto, entonces hacemos
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if codeSelector.selectedSegmentIndex == 0 {  // Si selecciono Codigo de Barras
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            } else {
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
        
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            displayCodeView.image = image
        }
        
        view.endEditing(true)
    }
    
    
}

