class Midi {

  Note note;
  int x, y, touchLoc, index, midiNote, oldMidiNote;  

  Midi() {
    oldMidiNote = -1;
    note = new Note(4, midiNote, 100);
  }

  void triggerNote(Touch touch) {
    touchLoc = (int) x + y * width; 
    index = (int) abs(map((blue(iL.pixels[touchLoc])), 0, 255, tone, 0)-1);
    x = (int) touch.getX();
    y = (int) touch.getY();
    touchLoc = (int) x + (int)abs(y)*width; 
    index = (int) abs(map((blue(iL.pixels[touchLoc])), 0, 255, tone, 0)-1); // Setzt den Array Index Anhand von Grauwerten
    midiNote = scaleOffset+scal.scales.get(scale)[index];
    if (midiNote != oldMidiNote) {
      myBus.sendNoteOff(note);
      println("NoteOn: " + note.toString());
      note.setPitch(midiNote);
      myBus.sendNoteOn(note);
      oldMidiNote = midiNote;
      //      delay(200);
    }
  }

  void stopNote() {
    myBus.sendNoteOff(note);
  }
}

