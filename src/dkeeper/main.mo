import List "mo:base/List";
import Debug "mo:base/Debug";
actor DKeeper {

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func addNote(noteTitle: Text, noteContent: Text) {
    let newNote: Note = {
      title = noteTitle;
      content = noteContent;
    };

    notes := List.push(newNote, notes);
  };

  public query func readNotes(): async [Note] {
    let x = List.toArray(notes);
    return x;
  };

  public func deleteNote(noteIndex: Nat) {
    var x = List.nil<Note>();
    if(noteIndex >= 1) { 
      x := List.take(notes, noteIndex);
    };
    notes := List.append(x, List.drop(notes, noteIndex+1));
  };
}