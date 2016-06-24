//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Eura Choi on 6/23/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addNote(newnote: Note){
        let realm=try! Realm();
        try! realm.write(){
            realm.add(newnote);
        }
    }
    static func deleteNote(note: Note){
        let realm=try! Realm();
        try! realm.write(){
            realm.delete(note);
        }
    }
    static func updateNote(noteToBeUpdated: Note, newNote: Note){
        let realm=try! Realm();
        try! realm.write(){
            noteToBeUpdated.title=newNote.title;
            noteToBeUpdated.content=newNote.content;
            noteToBeUpdated.modificationTime=newNote.modificationTime;
        }
    }
    static func retrieveNotes()-> Results<Note>{
        let realm = try! Realm();
        return realm.objects(Note).sorted("modificationTime", ascending: false);
    }
}