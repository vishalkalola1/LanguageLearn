//
//  VDatabaseManager.swift
//  Database
//
//  Created by Moweb on 06/02/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit
import SQLite3

class VDatabaseManager {
    
    static let shared = VDatabaseManager()
    var db: OpaquePointer?
    
    //database name
    var dataBaseName:String? {
        didSet {
            let fileManager = FileManager.default
            
            // database access
            let fileUrl = try!
                fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataBaseName!)
            print(fileUrl)
            do {
                if !fileManager.fileExists(atPath: fileUrl.path) {
                    print("DB does not exist in documents folder")
                    let value = self.dataBaseName?.components(separatedBy: ".")
                    if let dbFilePath = Bundle.main.path(forResource: value?.first, ofType: value?.last) {
                        try fileManager.copyItem(atPath: dbFilePath, toPath: fileUrl.path)
                        dbPath = dbFilePath
                    } else {
                        print("Uh oh - foo.db is not in the app bundle")
                    }
                } else {
                    print("Database file found at path: \(fileUrl.path)")
                    dbPath = fileUrl.path
                }
            } catch {
                print("Unable to copy foo.db: \(error)")
            }
        }
    }
    
    var dbPath : String? {
        didSet{
            openDatabase()
        }
    }
    
    func openDatabase() -> Void {
        print(dbPath!)
        if sqlite3_open(dbPath , &db) != SQLITE_OK{
            print("error while opening database")
        }else{
            print("Successful Open Database")
        }
    }
    
    private func makeStatement(_ Sql:String) -> OpaquePointer? {
        self.openDatabase()
        var statement : OpaquePointer?
        
        if sqlite3_prepare(db, Sql, -1, &statement, nil) == SQLITE_OK {
            return statement
        }else{
            return nil
        }
    }
    
    func executeQuery<T:Decodable>(_ sqlQuery:String, model: [T].Type? = nil) -> [T]? {
        guard let prepareStatement = makeStatement(sqlQuery) else { return nil}
        
        let columnCount = sqlite3_column_count(prepareStatement)
        
        var array = [[String:Any]]()
        while sqlite3_step(prepareStatement) == SQLITE_ROW {
            var dict = [String:Any]()
            for i in 0..<columnCount {
                var value: String = ""
                if let sqLite3ColumnText = sqlite3_column_text(prepareStatement, i) {
                    value = String(cString: sqLite3ColumnText)
                }
                let key = String.init(cString: sqlite3_column_name(prepareStatement, i))
                dict[key] = value
            }
            array.append(dict)
        }
        CloseDatabase(prepareStatement)
        if let model = model {
           return ConvertIntoModel(array, model: model) ?? nil
        }
        return nil
    }
    
    func ConvertIntoModel<T:Decodable>(_ array:[[String:Any]], model:[T].Type) -> [T]? {
        do {
            let jsonConvert = try JSONSerialization.data(withJSONObject: array, options: [])
            let ModelData = try JSONDecoder().decode(model.self, from: jsonConvert)
            return ModelData
        } catch let jsonErr {
            print("Error: ", jsonErr)
            return nil
        }
    }
    
    func getName(_ table:String, condition:String? = nil) -> (String?,Int?) {
        var sql = "select TopicName,MainTopicId from \(table)"
        if let condition = condition, condition != "" {
            sql += " where \(condition)"
        }
        
        guard let prepareStatement = makeStatement(sql) else { return (nil,nil)}
        var name : String?
        var mainTopicId : Int?
        
        while sqlite3_step(prepareStatement) == SQLITE_ROW {
            if let sqLite3ColumnText = sqlite3_column_text(prepareStatement, 0) {
                name = String(cString: sqLite3ColumnText)
            }
             let sqLite3ColumnId = Int(sqlite3_column_int(prepareStatement, 1))
            mainTopicId = sqLite3ColumnId
        }
        CloseDatabase(prepareStatement)
        return (name ?? "",mainTopicId)
        
    }
    
    func updateFav(data:String,condition:String) {
        let updateStatementString = "update DataManager SET isFavorite = \(data)  where \(condition)"
        guard let prepareStatement = makeStatement(updateStatementString)else{
            return
        }
        
        if sqlite3_step(prepareStatement) == SQLITE_DONE{
            //alert(msg: "Added to Favorite", title: "Let's Learn iOS")
        }
        else{
            //alert(msg: "Fail to Favorite", title: "Let's Learn iOS")
        }
        
        CloseDatabase(prepareStatement)
    }
    
    func CloseDatabase(_ prepareStatement:OpaquePointer){
        sqlite3_finalize(prepareStatement)
        sqlite3_close(self.db)
    }
}
