public class MIDIProcessor {

    MidiIn min;
    MidiOut mout;
    MidiMsg msg;

    true => int verbose;

    function int initialize(int deviceIn, int deviceOut) {

        if( !min.open( deviceIn ) )
            return 0;

        if (verbose)
            <<< "MIDIIn device:", min.num(), " -> ", min.name() >>>;

        if (deviceOut < 0 ) return 1;   // no output, only input

        if( !mout.open( deviceOut ) )
            return 0;

        if (verbose)
            <<< "MIDIOut device:", mout.num(), " -> ", mout.name() >>>;

        return 1;
    }

    // Endless cycle for processing
    function void run() {
        while( true )
        {
            min => now;

            while( min.recv(msg) )
            {
                if (verbose)
                    <<< msg.data1, msg.data2, msg.data3 >>>;
                process(msg);
            }
        }
    }

    // Function to be overloaded
    function void process(MidiMsg msg) {
        // mout.send(msg);
    }
}