//
//  ViewController.swift
//  PDFTronDemo
//
//  Created by   on 10/11/21.
//

import UIKit
import PDFNet
import Tools


class ViewController: UIViewController {
    
    var headerColor = UIColor.systemRed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.statusBarColorChange(color: headerColor)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @IBAction func btnShowPDFClicked(_ sender: Any) {
        self.showPDFTron()
    }
    
    /// showPDFTron: Call this method to show pdftron file
    func showPDFTron() {
//        UINavigationBar.appearance().barTintColor = UIColor.red
//        UINavigationBar.appearance().tintColor = UIColor.red
        
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.red
        
        DispatchQueue.main.async {
            // Create a PTDocumentController
            let documentController = PTDocumentController()
            // Open a file from URL.
            let fileURL: URL = URL(string:"https://pdftron.s3.amazonaws.com/downloads/pl/sample.pdf")!
            documentController.openDocument(with: fileURL)
            
            self.navigationController?.pushViewController(documentController, animated: true)
        }
    }
}


extension UIViewController {
    
    func statusBarColorChange(color: UIColor) {
      if #available(iOS 13.0, *) {
          let statusBar = UIView(frame: UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
          statusBar.backgroundColor = color
              statusBar.tag = 100
          UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
      } else {
              let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
              statusBar?.backgroundColor = color
          }
      }
}
