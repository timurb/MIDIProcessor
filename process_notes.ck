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
int inDevice;
int outDevice;

if (me.args()) {
    me.arg(0) => Std.atoi => int inDevice;
    me.arg(1) => Std.atoi => int outDevice;
} else {
    <<<"usage: chuck process_notes.ck:InDeviceNumber:OutDeviceNumber">>>;
    <<<"see chuck --probe for device numbers">>>;
    me.exit();
}

if (transposer.initialize(inDevice,outDevice)) {
    false => transposer.verbose;  // we have our own verbosity implemented
    transposer.run();
}
