class MIDIRelay extends MIDIProcessor {
    function void process(MidiMsg msg) {
        if (MIDI.messageType(msg.data1) == MIDI.CC) {
                <<< msg.data1, msg.data2, msg.data3 >>>;
                mout.send(msg);
            }
    }
}

MIDIRelay relay;
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

if (relay.initialize(inDevice,outDevice)) {
    false => relay.verbose;  // we have our own verbosity implemented
    relay.run();
}
