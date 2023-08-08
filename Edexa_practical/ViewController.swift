//
//  ViewController.swift
//  Edexa_practical
//
//  Created by Vrushik on 08/08/23.
//

import UIKit
import PDFKit

class ViewController: UIViewController, UIDocumentPickerDelegate {
    @IBOutlet weak var pdfView: PDFView!
    var signatureViews: [UIView] = [] // Array to store signature views

    override func viewDidLoad() {
        super.viewDidLoad()
        pdfView.autoScales = true
    }

    // Function to display the selected PDF
    func displayPDF(with url: URL) {
        let pdfDocument = PDFDocument(url: url)
        pdfView.document = pdfDocument
    }

    // Action to open the document picker
    @IBAction func openDocumentPicker(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .import)
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }

    // Delegate method to handle the selected PDF
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let url = urls.first {
            displayPDF(with: url)
        }
    }

    // Function to add a signature view to the PDF page
    func addSignatureView(to page: PDFPage, at position: CGPoint) {
//        let signatureView = SignatureView(frame: CGRect(x: position.x, y: position.y, width: 100, height: 50))
//        page.addSubview(signatureView)
//        signatureViews.append(signatureView)
    }

    // Action to save the signature position
    @IBAction func saveSignaturePosition(_ sender: Any) {
        guard let currentPage = pdfView.currentPage else { return }
        let signaturePosition = CGPoint(x: 100, y: 100) // Replace with the actual signature position
        addSignatureView(to: currentPage, at: signaturePosition)
    }
}

