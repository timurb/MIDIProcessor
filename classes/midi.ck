public class MIDI {

    static int NOTE_OFF;
    static int NOTE_ON;
    static int P_AFTER;
    static int CC;
    static int PROGRAM;
    static int C_AFTER;
    static int PITCH;
    static int SYSTEM;

    function static int messageType(int message)
    {
        return message / 16;
    }

    function static int channel(int message)
    {
        return message % 16;
    }
}

8  => MIDI.NOTE_OFF;
9  => MIDI.NOTE_ON;
10 => MIDI.P_AFTER;
11 => MIDI.CC;
12 => MIDI.PROGRAM;
13 => MIDI.C_AFTER;
14 => MIDI.PITCH;
15 => MIDI.SYSTEM;
