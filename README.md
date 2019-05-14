# MIDI Processor

This is a midi processing framework written in [ChucK](http://chuck.cs.princeton.edu).

Why not Python? Because it said that ChucK is strongly timed.

## Usage

Example usage of full MIDI relay:
```
chuck classes/* full_relay.ck
```

You can run as many commands as you wish and they should all work in sync inside a single ChucK VM.

## API Usage

When implementing MIDI processors create a subclass inheriting from `MIDIProcessor` and modify it to your needs.

Class `MIDIProcessor` provides 2 functions to be called and 1 function to be overloaded:

```
function int initialize(int deviceIn, int deviceOut)
```
Run it at the start of you program.
The function returns 0 if it can't open either input or output MIDI device.
If you don't need to output midi just pass `-1` as a second parameter.

```
function void run()
```
Endless cycle: read midi message and call `process(msg)`

```
function void process(MidiMsg msg)
```
Override this function in a subclass with your logic.

## License and authors

* Author:: Timur Batyrshin <erthad@gmail.com>
* License:: MIT