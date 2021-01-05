//
//  ViewController.swift
//  NetworkResponse
//
//  Created by Quinne Farenwald on 1/4/21.
//

import UIKit

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class ViewController: UIViewController {
    private var dataTask: URLSessionDataTask?
    var session: URLSessionProtocol = URLSession.shared
    
    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(encodedTerms)") else { return }
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request) {
            [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
                guard let self = self else { return }
                let decoded = String(data: data ?? Data(), encoding: .utf8)
                print("response: \(String(describing: response))")
                print("data: \(String(describing: decoded))")
                print("error: \(String(describing: error))")
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.dataTask = nil
                self.button.isEnabled = true
            }
        }
        button.isEnabled = false
        dataTask?.resume()
    }
    
    @IBAction private func buttonTapped() {
        searchForBook(terms: "out from boneville")
    }
}

extension URLSession: URLSessionProtocol {}
