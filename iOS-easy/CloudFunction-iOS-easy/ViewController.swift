/*
 * Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import AGConnectFunction

class ViewController: UIViewController {
    
    let yearTextField = UITextField(frame: CGRect(x: 60, y: 180, width: 200, height: 40))
    
    let zodiacLabel = UILabel(frame: CGRect(x: 60, y: 260, width: 150, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let welcomeLabel = UILabel(frame: CGRect(x: 60, y: 100, width: 200, height: 60))
        welcomeLabel.textColor = UIColor.darkGray
        welcomeLabel.text = "Please enter the year"
        self.view.addSubview(welcomeLabel)

        yearTextField.layer.borderWidth = 0.5
        yearTextField.layer.borderColor = UIColor.darkGray.cgColor
        self.view.addSubview(yearTextField)

        zodiacLabel.textAlignment = .center
        zodiacLabel.textColor = UIColor.darkGray
        self.view.addSubview(zodiacLabel)

        let functionButton = UIButton(frame: CGRect(x: 60, y: 380, width: 140, height: 50))
        functionButton.backgroundColor = UIColor.blue
        functionButton.setTitle("GET RESULT", for: .normal)
        functionButton.addTarget(self, action: #selector(triggerFunction), for: .touchUpInside)
        self.view.addSubview(functionButton)

        
    }
    
    @objc func triggerFunction() {
        let num = yearTextField.text ?? ""
        let callable = AGCFunction.getInstance().wrap("zodiac-$latest")
        callable.call(with: ["year":num]).onSuccess { (result) in
            let response = result?.value(with: NSDictionary.self) as! NSDictionary
            let zodiac = response["result"] as! String
            self.zodiacLabel.text = zodiac
       }.onFailure { (error) in
            print(error)
        }

    }


}

