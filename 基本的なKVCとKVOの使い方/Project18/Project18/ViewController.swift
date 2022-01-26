//
//  ViewController.swift
//  Project18
//
//  Created by HIROKI IKEUCHI on 2022/01/26.
//

import Cocoa

class ViewController: NSViewController {

    // MARK: - Properties
    
    @objc dynamic var temperatureCelsius: Double = 50 {
        didSet {
            updateFarenheight()
        }
    }
    
    @objc dynamic var temperatureFahrenheit: Double = 50
    
    @objc dynamic var icon: String {
        
        switch temperatureCelsius {
            
        case let temp where temp < 0:
            return "⛄️"
        case 0...10:
            return "❄️"
        case 10...20:
            return "☁️"
        case 20...30:
            return "🌤"
        case 30...40:
            return "☀️"
        case 40...50:
            return "🔥"
        default:
            return "💀"
        }
    }
    
    // MARK: - Lifecycles
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFarenheight()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: - KVC Methods
    
    override func setNilValueForKey(_ key: String) {
        
        // NSTextFieldが空になった場合にExceptionを防ぐための処理
        if key == "temperatureCelsius" {
            temperatureCelsius = 0
        }
    }
    
    // MARK: - KVO Methods
    
    // ある値が影響を与えるプロパティのキーを返す
    override class func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        if key == "icon" {
            return ["temperatureCelsius"]
        } else {
            return []
        }
    }
    
    // MARK: - Actions
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        temperatureCelsius = 50
    }
        
    // MARK: - Helpers
    
    private func updateFarenheight() {
        let celsius = Measurement(value: temperatureCelsius, unit: UnitTemperature.celsius)
        temperatureFahrenheit = round(celsius.converted(to: .fahrenheit).value)
    }

}

