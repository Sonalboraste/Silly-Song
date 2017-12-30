//
//  ViewController.swift
//  Silly Song
//
//  Created by Mrunal Bhatt on 8/26/17.
//  Copyright © 2017 Mrunal Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    
    @IBAction func txtEnterNameOnEditingBegin(_ sender: Any)
    {
        nameField.text=""
        lyricsView.text=""
    }
    
    
    
    @IBAction func txtEnterNameOnEditingEnd(_ sender: Any)
    {
        guard let strName = nameField.text, !strName.isEmpty else
        {
            lyricsView.text = "Please enter the name."
            return
        }
        
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: strName)
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String
    {
        
        let shortName = shortNameForName(name: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
    
    func shortNameForName(name: String) -> String
    {
        let lowercaseName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        
        if let index = lowercaseName.rangeOfCharacter(from: vowelSet)?.lowerBound
        {
            return lowercaseName.substring(from: index)
        }
        
        return lowercaseName
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}



