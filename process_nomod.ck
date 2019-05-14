class MIDIRelay extends MIDIProcessor {
    if (MIDI.messageType(msg.data1) != MIDI.NOTE_ON &&
        MIDI.messageType(msg.data1) != MIDI.NOTE_OFF &&
        MIDI.messageType(msg.data1) != MIDI.CC) 
        {
            <<< msg.data1, msg.data2, msg.data3 >>>;
            mout.send(msg);
        }
}

MIDIRelay relay;

if (relay.initialize(0,0)) {
    false => relay.verbose;  // we have our own verbosity implemented
    relay.run();
}