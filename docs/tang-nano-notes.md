# Tang Nano Notes

An evolving list of common issues when programming the Tang Nano.

## Programming to Embedded Flash error `Finished, NOT wakes up`

<details>
<summary>Gowin Programmer Output</summary>

```
Info:	"SRAM Program" starting on device-1...
Info:	User Code: 0x00001F82
Info:	Status Code: 0x0001F020
Info:	Cost 4.6 second(s)
:	 
Info:	"SRAM Program" starting on device-1...
Info:	User Code: 0x00001F82
Info:	Status Code: 0x0001F020
Info:	Cost 4.59 second(s)
:	 
Info:	"embFlash Erase,Program" starting on device-1...
Info:	Status Code: 0x00019020
Error:	Finished, NOT wakes up
Info:	User Code: 0x00000000
Info:	Finished!
Info:	Cost 11.64 second(s)
:	 
Info:	"embFlash Erase,Program" starting on device-1...
Info:	Status Code: 0x0001F020
Info:	User Code: 0x00001F82
Info:	Finished!
Info:	Cost 26.36 second(s)
:	 
```
</details>

If you encounter a `Finished, NOT wakes up` error when programming the
embedded flash, check the frequency in `Cable Settings`. Increasing it to
2.5MHz from the default 2MHz resolved my issue.

> **NOTE:** The Tang Nano does not support frequencies above 24Mhz. Ensure
the selected frequency does not exceed this.

![](./images/tang-nano-notes/cable_settings.png)
