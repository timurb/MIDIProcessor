public class MIDI {

    8  => static int NOTE_OFF;
    9  => static int NOTE_ON;
    10 => static int P_AFTER;
    11 => static int CC;
    12 => static int PROGRAM;
    13 => static int C_AFTER;
    14 => static int PITCH;
    15 => static int SYSTEM;

    function static int messageType(int message)
    {
        return message / 16;
    }

    function static int channel(int message)
    {
        return message % 16;
    }
}