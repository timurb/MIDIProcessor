public class MIDI {

    8  => int NOTE_OFF;
    9  => int NOTE_ON;
    10 => int P_AFTER;
    11 => int CC;
    12 => int PROGRAM;
    13 => int C_AFTER;
    14 => int PITCH;

    function static int messageType(int message)
    {
        return message / 16;
    }

    function static int channel(int message)
    {
        return message % 16;
    }
}