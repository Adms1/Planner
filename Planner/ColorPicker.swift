//
//  ColorPicker.swift
//  Planner
//
//  Created by ADMS on 21/12/21.
//

import UIKit
import CULColorPicker

protocol colorPickerDelegate:class {
    func selectedColor(color:UIColor)
}


class ColorPicker: UIViewController, ColorPickerViewDelegate {
    func colorPickerWillBeginDragging(_ colorPicker: ColorPickerView) {
    }

    func colorPickerDidEndDagging(_ colorPicker: ColorPickerView) {
    }


    @IBOutlet weak var colorPicker: ColorPickerView!
    weak var delegate:colorPickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegate of color picker
     //   colorPicker.selectedColor = UIColor.black.cgColor
        colorPicker.delegate = self
    }

    func colorPickerDidSelectColor(_ colorPicker: ColorPickerView) {
      // Can get the selected color from the color picker
      let selcolor = colorPicker.selectedColor
        delegate?.selectedColor(color: selcolor)
    }
    @IBAction func btnClickBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: false)
    }

}
