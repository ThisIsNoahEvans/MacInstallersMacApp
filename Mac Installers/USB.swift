//
//  USB.swift
//  Mac Installers
//
//  Created by Noah Evans on 29/07/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import Foundation
import Cocoa

class USBCreator: NSViewController {
    
    @IBOutlet weak var driveField: NSTextField!
    
    @IBOutlet weak var createOutlet: NSButton!
    
    @IBOutlet weak var processBar: NSProgressIndicator!
    
    let savePanel = NSOpenPanel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createOutlet.isHidden = true
        processBar.isHidden = true
        processBar.stopAnimation(Any?.self)
        
    }
    
    @IBAction func selectInstaller(_ sender: Any) {
        savePanel.title = "Open an installer"
        savePanel.prompt = "Open"
        savePanel.nameFieldLabel = "File Name:"
        savePanel.isExtensionHidden = false
        savePanel.canSelectHiddenExtension = true
        savePanel.canChooseDirectories = false
        savePanel.canChooseFiles = true
        savePanel.allowedFileTypes = ["app", "dmg"]
        
        if (savePanel.runModal() == NSApplication.ModalResponse.OK) {
            print("Selected installed")
            createOutlet.isHidden = false
        }
        

}
    @IBAction func createUSB(_ sender: Any) {
        
        let proceedAlert = NSAlert()
        proceedAlert.messageText = "Just to be sure..."
        proceedAlert.informativeText = "You're about to erase your USB drive and make it into a bootable USB for OS X or macOS. This will remove all data on the drive."
        proceedAlert.addButton(withTitle: "Yes, go ahead.")
        proceedAlert.addButton(withTitle: "No, cancel.")

        let modalResult = proceedAlert.runModal()

        switch modalResult {
        case .alertFirstButtonReturn: // NSApplication.ModalResponse.alertFirstButtonReturn
            print("User confirmed yes")
            // Get URL
            var filePath = savePanel.url!.absoluteString
            let url: URL = savePanel.url!.absoluteURL
            print(url)
            print(filePath)
            filePath.removeFirst(7)
            let finalPath: String = filePath.decodeUrl()!
            print(finalPath)
            let fileName: String = savePanel.url!.lastPathComponent
            let fileType: String = savePanel.url!.pathExtension
            let fileLocation: String = filePath.replacingOccurrences(of: fileName, with: "")
            if fileType == "app" {
                print("User selected app")
                // Define task
                let task = Process()
                // osascript "/Library/Application Support/Velocity Apps/Mac Installers/Supporting Files/make-usb-app.scpt" "/dev/disk2" "/app-location.app"
                let command = "osascript \"/Library/Application Support/Velocity Apps/Mac Installers/Supporting Files/make-usb-app.scpt\" \"\(driveField.stringValue)\" \"\(finalPath)\""
                
                task.executableURL = URL(fileURLWithPath: "/bin/zsh")
                task.arguments = ["--login", "-c", command]
                
                let connection = Pipe()
                task.standardOutput = connection
                // Run task
                do {
                    processBar.startAnimation(Any?.self)
                    processBar.isHidden = false
                    try task.run()
                    task.waitUntilExit()
                }
                catch {
                    let errorAlert = NSAlert()
                    errorAlert.alertStyle = .critical
                    errorAlert.messageText = "There was a problem making your USB."
                    errorAlert.informativeText = "Please try again or contact support."
                    errorAlert.runModal()
                    
                    processBar.isHidden = true
                    processBar.stopAnimation(Any?.self)
                }
            }
        default:
            print("User cancelled")
        }


        }
    }

extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
}
