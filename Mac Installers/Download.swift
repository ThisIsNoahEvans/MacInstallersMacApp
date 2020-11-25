//
//  ViewController.swift
//  Mac Installers
//
//  Created by Noah Evans on 24/07/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import Cocoa

class DownloadVC: NSViewController {
    
    @IBOutlet weak var downloadOutlet: NSButton!
    
    var chosenOS: String = ""
    
    // https://cdn.itsnoahevans.co.uk/content/PinchPunch-FirstMonth.png
    
    func download(url: String) {
        /// Replace this when appcdn.macinstallers.tech is working
        let fileName = url.replacingOccurrences(of: "https://cdn.itsnoahevans.co.uk/content/", with: "")
        print("File name is \(fileName)")
        let savePanel = NSSavePanel()
        savePanel.title = "Download"
        savePanel.prompt = "Save"
        savePanel.nameFieldLabel = "File Name"
        savePanel.nameFieldStringValue = fileName
        savePanel.isExtensionHidden = false
        savePanel.canSelectHiddenExtension = true
        savePanel.allowedFileTypes = ["png"]
        
        if (savePanel.runModal() == NSApplication.ModalResponse.OK) {
            // User selected download location
            let location = savePanel.url!
            var filePath: String = location.absoluteString
            filePath = String(filePath.dropFirst(7))
            print(filePath)
            
            let urlToDownload = URL(string: url)!

            URLSession.shared.downloadTask(with: urlToDownload, completionHandler: { (tempURL, response, error) in
                
            }).resume()
        }
        else {
            // User cancelled
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        chosenOS = "NONE"
        downloadOutlet.isHidden = true
    }
    
    @IBAction func downloadAction(_ sender: Any) {
        if chosenOS != "NONE" {
            print("OS is selected")
            print(chosenOS)
            download(url: "https://cdn.itsnoahevans.co.uk/content/PinchPunch-FirstMonth.png")
        }
        else {
            print("No OS selected")
            let alert = NSAlert()
            alert.alertStyle = .informational
            alert.messageText = "Oops, please select an operating system to continue."
            alert.informativeText = "You can do this by using the dropdown to the left."
            alert.runModal()
        }
    }
    
    @IBAction func choose(_ sender: Any) {
        chosenOS = "NONE"
        downloadOutlet.isHidden = true
    }
    
    @IBAction func os81(_ sender: Any) {
        chosenOS = "OS_8.1"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func os9(_ sender: Any) {
        chosenOS = "0S_9"
        downloadOutlet.isHidden = false
    }
    
    
    @IBAction func osXCand(_ sender: Any) {
        chosenOS = "OS_X_CAND"
        downloadOutlet.isHidden = false
    }

    @IBAction func osXRasp(_ sender: Any) {
        chosenOS = "OS_X_RASP"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func cheetah(_ sender: Any) {
        chosenOS = "CHEETAH"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func puma(_ sender: Any) {
        chosenOS = "PUMA"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func jaguar(_ sender: Any) {
        chosenOS = "JAGUAR"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func jaguarServer(_ sender: Any) {
        chosenOS = "JAGUAR_SERVER"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func panther(_ sender: Any) {
        chosenOS = "PANTHER"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func pantherServer(_ sender: Any) {
        chosenOS = "PANTHER_SERVER"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func tigerDVD(_ sender: Any) {
        chosenOS = "TIGER_DVD"
        downloadOutlet.isHidden = false
    }

    @IBAction func tigerCD(_ sender: Any) {
        chosenOS = "TIGER_CD"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func tigerServer(_ sender: Any) {
        chosenOS = "TIGER_SERVER"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func leopard(_ sender: Any) {
        chosenOS = "LEOPARD"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func leopardServer(_ sender: Any) {
        chosenOS = "LEOPARD_SERVER"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func snow(_ sender: Any) {
        chosenOS = "SNOW_LEOPARD"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func lion(_ sender: Any) {
        chosenOS = "LION"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func mountLion(_ sender: Any) {
        chosenOS = "MOUNTAIN_LION"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func mavericks(_ sender: Any) {
        chosenOS = "MAVERICKS"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func yosemite(_ sender: Any) {
        chosenOS = "YOSEMITE"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func elCap(_ sender: Any) {
        chosenOS = "EL_CAPITAN"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func sierra(_ sender: Any) {
        chosenOS = "SIERRA"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func highSierra(_ sender: Any) {
        chosenOS = "HIGH_SIERRA"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func mojave(_ sender: Any) {
        chosenOS = "MOJAVE"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func catalina(_ sender: Any) {
        chosenOS = "CATALINA"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func beOS(_ sender: Any) {
        chosenOS = "BE_OS"
        downloadOutlet.isHidden = false
    }
    
    @IBAction func macTV(_ sender: Any) {
        chosenOS = "MAC_TV"
        downloadOutlet.isHidden = false
    }
    

}

