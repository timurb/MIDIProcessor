class MIDIRelay extends MIDIProcessor {
    function void process(MidiMsg msg) {
        mout.send(msg);
    }
}

MIDIRelay relay;

if (relay.initialize(0,0))
    relay.run();
