//
//  ViewController.swift
//  seatingArrangmentDemo
//
//  Created by Square Infosoft on 20/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customViewHeight: NSLayoutConstraint!
    @IBOutlet weak var customViewWidth: NSLayoutConstraint!
    @IBOutlet weak var customView: UIView!

    private let tables = [Tables(tableId: "1", tableNo: "1", leftX: 50, topY: 50, size: "large", shape: "square", capacity: 4, noOfBookingRequest: 2, noOfReservationUpcoming: 2, isBooked: true),
                          Tables(tableId: "2", tableNo: "2", leftX: 150, topY: 50, size: "medium", shape: "square", capacity: 3, noOfBookingRequest: 3, noOfReservationUpcoming: 1, isBooked: false),
                          Tables(tableId: "3", tableNo: "3", leftX: 250, topY: 50, size: "small", shape: "square", capacity: 2, noOfBookingRequest: 2, noOfReservationUpcoming: 2, isBooked: false),

                          Tables(tableId: "4", tableNo: "4", leftX: 50, topY: 150, size: "large", shape: "circle", capacity: 4, noOfBookingRequest: 2, noOfReservationUpcoming: 2, isBooked: false),
                          Tables(tableId: "5", tableNo: "5", leftX: 150, topY: 150, size: "medium", shape: "circle", capacity: 3, noOfBookingRequest: 3, noOfReservationUpcoming: 2, isBooked: true),
                          Tables(tableId: "6", tableNo: "6", leftX: 250, topY: 150, size: "small", shape: "circle", capacity: 2, noOfBookingRequest: 2, noOfReservationUpcoming: 3, isBooked: false),

                          Tables(tableId: "7", tableNo: "7", leftX: 50, topY: 250, size: "large", shape: "rectangle", capacity: 4, noOfBookingRequest: 2, noOfReservationUpcoming: 2, isBooked: false),
                          Tables(tableId: "8", tableNo: "8", leftX: 150, topY: 250, size: "medium", shape: "rectangle", capacity: 3, noOfBookingRequest: 2, noOfReservationUpcoming: 2, isBooked: false),
                          Tables(tableId: "9", tableNo: "9", leftX: 250, topY: 250, size: "small", shape: "rectangle", capacity: 2, noOfBookingRequest: 2, noOfReservationUpcoming: 0, isBooked: true),
                          Tables(tableId: "9", tableNo: "9", leftX: 870, topY: 270, size: "small", shape: "square", capacity: 2, noOfBookingRequest: 2, noOfReservationUpcoming: 2, isBooked: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        customView.frame.size.height = 400
//        customView.frame.size.width = 900
        customViewHeight.constant = 400 // max y
        customViewWidth.constant = 900 // max x

        tables.forEach { table in
            if let viewDemo = TableView.initializeFromNib() as? TableView {
                viewDemo.tag = Int(table.tableNo ?? "") ?? 0
                var width = 0
                var height = 0
                switch table.size {
                case "small":
                    width = FixValue.smallWeight
                    height = FixValue.smallHeight
                case "medium":
                    width = FixValue.mediumWeight
                    height = FixValue.mediumHeight
                case "large":
                    width = FixValue.largeWeight
                    height = FixValue.largeHeight
                default:
                    break
                }
                switch table.shape {
                case "circle":
                    height = width
                    viewDemo.seatImg.layer.cornerRadius = CGFloat((height - 20) / 2)
//                    viewDemo.seatImg.image = AssestImage.circuleTable
                case "rectangle":
//                    viewDemo.seatImg.image = AssestImage.recTable
                    break
                case "square":
                    height = width
//                    viewDemo.seatImg.image = AssestImage.squareTable
                default:
                    break
                }
                viewDemo.noOfBookingRequestLbl.text = "\(table.noOfBookingRequest ?? 0)"
                viewDemo.noOfBookingReservationLbl.text = "\(table.noOfReservationUpcoming ?? 0)"
                viewDemo.tableNoLbl.text = table.tableNo
                viewDemo.capacityLbl.text = "\(table.capacity ?? 0)"
                viewDemo.seatImg.backgroundColor = table.isBooked == true ? .red : UIColor(red: 0, green: 1, blue: 148/255, alpha: 1)
                viewDemo.frame = CGRect(x: table.leftX ?? 0, y: table.topY ?? 0, width: width, height: height)
                self.customView.addSubview(viewDemo)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClickView))
                viewDemo.isUserInteractionEnabled = true
                viewDemo.addGestureRecognizer(tap)
            }
            
            
        }
    }
    
    @objc func onClickView(_ sender: UITapGestureRecognizer) {
        if let index = sender.view?.tag {
            let table = tables[index - 1]
            show("table selected", "Table No: \(table.tableNo ?? "") \n Capacity: \(table.capacity ?? 0) \n No of Booking \(table.noOfBookingRequest ?? 0) \n \(table.isBooked == true ? "Table is not available" : "Book now...")", "Ok")
        }
    }
    
    func show(_ title: String? = nil, _ message: String? = nil, _ actionName: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionName, style: .cancel, handler: nil))
        keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    var keyWindow: UIWindow? {
        get {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            } else {
                return UIApplication.shared.keyWindow
            }
        }
    }
}


class TableView: UIView {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var seatImg: UIImageView!
    
    @IBOutlet weak var tableNoLbl: UILabel!
    @IBOutlet weak var noOfBookingRequestLbl: UILabel!
    @IBOutlet weak var noOfBookingReservationLbl: UILabel!
    @IBOutlet weak var capacityLbl: UILabel!
    class func initializeFromNib() -> UIView {
        UINib(nibName: "TableView", bundle: Bundle.main).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
}
