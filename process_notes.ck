class NoteTranspose extends MIDIProcessor {
    function void process(MidiMsg msg) {
        if (MIDI.messageType(msg.data1) == MIDI.NOTE_ON ||
            MIDI.messageType(msg.data1) == MIDI.NOTE_OFF) {
                <<< msg.data1, msg.data2, msg.data3 >>>;
                3 -=> msg.data2;

                <<< msg.data1, msg.data2, msg.data3 >>>;
                mout.send(msg);
            }
    }
}

NoteTranspose transposer;

if (transposer.initialize(1,0)) {
    false => transposer.verbose;  // we have our own verbosity implemented
    transposer.run();
}
