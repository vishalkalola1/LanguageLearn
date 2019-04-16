//
//  favoriteVC.swift
//  LliTest
//
//  Created by MTPL on 08/02/19.
//  Copyright © 2019 MTPL. All rights reserved.
//
import UIKit
import Speech
import AVFoundation

class favoriteVC : BaseViewController{
}
//    @IBOutlet weak var tblFav: UITableView!
//    @IBOutlet weak var lblNotFav: UILabel!
//    @IBOutlet weak var textFvSearch: UITextField!
//    @IBOutlet weak var btnCancel: UIButton!
//    @IBOutlet weak var btnSearch: UIButton!
//
//    @IBOutlet weak var btnMic: UIButton!
//    //@IBOutlet weak var viewDesign: GradientView!
//    var SelectedData = Array<Int>()
//    var customColor : [UIColor] = [UIColor]()
//    let vObj = VDatabaseManager.shared
//    var dataArray = [[String:Any]]()
//    var filteredDataArray : [[String:Any]]?
//    //var homeArray : [HomeItem]?
//
//    //mic Animation
//    var bgPath: UIBezierPath!
//    var shapeLayer: CAShapeLayer!
//    var progressLayer: CAShapeLayer!
//    var progress: Float = 0 {
//        willSet(newValue)
//        {
//            progressLayer.strokeEnd = CGFloat(newValue)
//        }
//    }
//    var alphaZeroTimer : Timer?
////    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
////    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
////    private var recognitionTask: SFSpeechRecognitionTask?
////    private let audioEngine = AVAudioEngine()
//    var isRecording = false
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        viewDesign.layer.shadowColor = #colorLiteral(red: 0.2042354061, green: 0.1125700552, blue: 0, alpha: 1)
////        viewDesign.layer.shadowOpacity = 1
////        viewDesign.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
////        viewDesign.layer.shadowRadius = 5
////
//        let paddingView = UIView(frame: CGRect.init(x: 0, y: 0, width: 22, height: 44))
//        textFvSearch.rightView = paddingView
//        textFvSearch.rightViewMode = .always
//
//        textFvSearch.addTarget(self, action: #selector(search(_:)), for: .editingChanged)
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        customColor = [#colorLiteral(red: 0.7343687136, green: 0.9295110244, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.6864915629, green: 0.5928410323, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.6516680465, blue: 0.7344312514, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.7163019496, blue: 0.6600852102, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.9252332564, blue: 0.7171542069, alpha: 1),#colorLiteral(red: 0.7680212324, green: 0.8862745166, blue: 0.7207610837, alpha: 1)]
//        let headerNib = UINib.init(nibName: "CustomHeader", bundle: Bundle.main)
//        tblFav.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeader")
//        getData()
//        //animateTable(TableName: tblFav)
//        btnMic.layer.cornerRadius = 22.0
//        btnMic.layer.masksToBounds = true
//        speechRecognizer.delegate = self
//        //SFSpeechRecognizer.requestAuthorization { (authStatus) in
//
//            var isButtonEnabled = false
//
//            switch authStatus {
//            case .authorized:
//                isButtonEnabled = true
//
//            case .denied:
//                isButtonEnabled = false
//                print("User denied access to speech recognition")
//
//            case .restricted:
//                isButtonEnabled = false
//                print("Speech recognition restricted on this device")
//
//            case .notDetermined:
//                isButtonEnabled = false
//                print("Speech recognition not yet authorized")
//            }
//
//            OperationQueue.main.addOperation() {
//                self.btnMic.isEnabled = isButtonEnabled
//            }
//        }
//
//        btnMic.addTarget(self, action: #selector(holdRelease), for: UIControl.Event.touchUpInside)
//        btnMic.addTarget(self, action: #selector(HoldDown), for: UIControl.Event.touchDown)
//        btnMic.addTarget(self, action: #selector(holdRelease), for: UIControl.Event.touchDragOutside)
//
//        btnMic.addTarget(self, action: #selector(holdRelease), for: UIControl.Event.touchCancel)
//    }
//    //target functions
//    @objc func HoldDown(sender:UIButton)
//    {
//        textFvSearch.isHidden = false
//        btnCancel.isHidden = false
//        textFvSearch.text = ""
//        textFvSearch.resignFirstResponder()
//        startRecording()
//        btnCancel.setImage(#imageLiteral(resourceName: "microphone_red"), for: .normal)
//        alphaZeroTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(alphaZero), userInfo: nil, repeats: true)
//    }
//    @objc func alphaZero()
//    {
//        UIView.animate(withDuration: 0.5) {
//            if self.btnCancel.alpha == 0 {
//                self.btnCancel.alpha = 1
//            }else{
//                self.btnCancel.alpha = 0
//            }
//        }
//
//    }
//    @objc func holdRelease(sender:UIButton)
//    {
//        alphaZeroTimer?.invalidate()
//        btnCancel.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
//        audioEngine.stop()
//        recognitionRequest?.endAudio()
////        if textFvSearch.text == "" {
////            textFvSearch.isHidden = true
////            btnCancel.isHidden = true
////        }
//        textFvSearch.placeholder = "Search"
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        if textFvSearch.text == "" {
//            getData()
//        }
//        tblFav.reloadData()
//
//    }
//    @objc func search(_ textfield: UITextField) {
//        SearchText(textfield.text!)
//    }
//    @IBAction func btnSearch(_ sender: Any) {
//        textFvSearch.placeholder = "Search"
//        if(textFvSearch.isHidden == true){
//            textFvSearch.isHidden = false
//            btnCancel.isHidden = false
//            textFvSearch.becomeFirstResponder()
//        }else{
//            textFvSearch.isHidden = true
//            btnCancel.isHidden = true
//            SearchText(textFvSearch.text!)
//            textFvSearch.resignFirstResponder()
//        }
//    }
//    @IBAction func btnCancel(_ sender: Any) {
//        textFvSearch.text = ""
//        SearchText("")
//    }
//    @IBAction func btnFavBack(_ sender: Any) {
//    }
//    func SearchText(_ text: String) {
//        if text != "" {
//            filteredDataArray?.removeAll()
//            SelectedData.removeAll()
//            for objdata in dataArray {
//                var data = objdata
//                let searchText = text.lowercased()
//                if (data["SubTopicName"] as! String).lowercased().contains(searchText){
//                    self.filteredDataArray?.append(data)
//                }
//
//                if data["SubTopicName"] as! String == "" {
//                    let topicID = data["TopicID"] as! String
//                    let topicName = vObj.getName("TopicManager", condition: "TopicId = \(topicID)")
//                    if (topicName.0?.lowercased().contains(searchText))! {
//                        self.filteredDataArray?.append(data)
//                    }
//                }
//            }
//        }else{
//            filteredDataArray = dataArray
//        }
//
//        //tblFav.reloadDataWithAlert(dataSet: filteredDataArray, selfView: self.view)
//    }
//    func getData() -> Void {
////        if let subTopicArray = vObj.fetchDataFrom("DataManager", condition: "isFavorite = 1") {
////            dataArray = subTopicArray
////        }
//        filteredDataArray = dataArray
//        if(filteredDataArray!.count == 0){
//            lblNotFav.isHidden = false
//        }else{
//            lblNotFav.isHidden = true
//        }
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "FavVCToXcVC" {
//            if let destinationVC = segue.destination as? CodeViewController {
//                if let senderAsIndexPath = sender as? IndexPath {
//                    let obj = filteredDataArray![senderAsIndexPath.row]
//                    destinationVC.tempId = obj["SubTopicId"] as? String
//                    destinationVC.details = obj["SubTopicData"] as? String
//                    destinationVC.tempfav = obj["isFavorite"] as? String
//                    destinationVC.getindex = obj["TopicID"] as? String
//                    let topicID = filteredDataArray![senderAsIndexPath.row]["TopicID"] as! String
//                    if obj["SubTopicName"] as? String == "" {
//                        destinationVC.title_text = vObj.getName("TopicManager", condition: "TopicId = \(topicID)").0
//                    }else{
//                        destinationVC.title_text = obj["SubTopicName"] as? String
//                    }
//                }
//            }
//        }
//    }
//}
//extension favoriteVC{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredDataArray?.count ?? 0
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let favCell = tableView.dequeueReusableCell(withIdentifier: "FavCell") as! FavCell
//        let subTopicName = filteredDataArray![indexPath.row]["SubTopicName"] as! String
//        let topicID = filteredDataArray![indexPath.row]["TopicID"] as! String
//        let mainTopicName = vObj.getName("TopicManager", condition: "TopicId = \(topicID)")
//        if subTopicName == "" {
//            favCell.lblFavTitle.text = mainTopicName.0
//        }else{
//            favCell.lblFavTitle.text = subTopicName
//        }
//        favCell.viewFavDesign.layer.cornerRadius = 20.0
//        favCell.viewFavDesign.backgroundColor = customColor[(indexPath.row) % (self.customColor.count)]
//        favCell.viewFavDesign.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        favCell.viewFavDesign.layer.shadowOpacity = 0.8
//        favCell.viewFavDesign.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        favCell.viewFavDesign.layer.shadowRadius = 4
//        favCell.lblTopicPath.text = "\(self.homeArray![mainTopicName.1!].itemName) > \(mainTopicName.0 ?? "")"
//        return favCell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "FavVCToXcVC", sender: indexPath)
//    }
//}
//extension favoriteVC : SFSpeechRecognizerDelegate{
//    func cancelRecording() {
//        audioEngine.stop()
//        isRecording = false
//        audioEngine.inputNode.removeTap(onBus: 0)
//        recognitionTask?.cancel()
//        //self.request.endAudio()
//        progressLayer.removeFromSuperlayer()
//        shapeLayer.removeFromSuperlayer()
//    }
//    //MARK: - Recognize Speech
//    func startRecording() {
//
//        if recognitionTask != nil {  //1
//            recognitionTask?.cancel()
//            recognitionTask = nil
//        }
//
//        let audioSession = AVAudioSession.sharedInstance()  //2
//        do {
//            try audioSession.setCategory(AVAudioSession.Category.record, mode: .measurement, options: .defaultToSpeaker)
//            try audioSession.setMode(AVAudioSession.Mode.measurement)
//            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
//        } catch {
//            print("audioSession properties weren't set because of an error.")
//        }
//
//        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()  //3
//
//        let inputNode = audioEngine.inputNode
//
//        guard let recognitionRequest = recognitionRequest else {
//            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
//        } //5
//
//        recognitionRequest.shouldReportPartialResults = true  //6
//
//        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in  //7
//
//            var isFinal = false  //8
//
//            if result != nil {
//
//                self.textFvSearch.text = (result?.bestTranscription.formattedString) //9
//                self.SearchText(self.textFvSearch.text!)
//                isFinal = (result?.isFinal)!
//            }else{
//                showToast(message: "Hold to record and speak to search...", SelfView: self.view)
//            }
//
//            if error != nil || isFinal {  //10
//                self.audioEngine.stop()
//                inputNode.removeTap(onBus: 0)
//
//                self.recognitionRequest = nil
//                self.recognitionTask = nil
//
//
//            }
//        })
//        inputNode.removeTap(onBus: 0)
//        let recordingFormat = inputNode.outputFormat(forBus: 0)  //11
//        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
//            self.recognitionRequest?.append(buffer)
//        }
//        audioEngine.prepare()  //12
//        do {
//            try audioEngine.start()
//        } catch {
//            print("audioEngine couldn't start because of an error.")
//        }
//        textFvSearch.placeholder = "I'm listening!"
//    }
//    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
//
//    }
//
//}

class FavCell : UITableViewCell{
    @IBOutlet weak var lblFavTitle: UILabel!
    @IBOutlet weak var viewFavDesign: UIView!
    @IBOutlet weak var lblTopicPath: UILabel!
}
