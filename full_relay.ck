class MIDIRelay extends MIDIProcessor {
    function void process(MidiMsg msg) {
        mout.send(msg);
    }
}

MIDIRelay relay;

if (relay.initialize(1,0))
    relay.run();
