@echo off
:: Contact me on YouTube at http://www.youtube.com/user/FtDSpartn if you have any troubles.
::::::::::::::
:: Settings ::
::::::::::::::
:: Window Name				-- The name of the audio repeater window. Leave blank to use default.
set arWindowName=
:: Path						-- The path to the audio repeater executable.
set arPath=C:\Program Files\Virtual Audio Cable\audiorepeater.exe
:: Input device name		-- The name of the device to take input from. This must be exactly as it appears in Audio Repeater.
set arInput=Line 1 (Virtual Audio Cable)
:: Output device name 		-- The name of the device to output to. This must be exactly as it appears in Audio Repeater.
set arOutput=Speakers (AudioQuest DragonFly)
:: Sample Rate 				-- The maximum frequency that can be played. 44100 Hz (44.1 kHz) should be good enough for most purposes.
set arSamplingRate=96000
:: Bits per Sample 			-- Also known as 'Bit Depth' or 'Sample Format'. If you are not going to be doing any audio editing, 24 bits should suffice.
:: Allowed Values: [ 8 | 16 | 18 | 20 | 22 | 24 | 32 ]
set arBitsPerSample=24
:: Channels 				-- This affects how many audio channels there will be. Usually overridden by Channel Cfg. Examples: Mono = 1, Stereo = 2, 7.1 surround = 8
set arChannels=2
:: Channel Configuration	-- This affects how many audio channels there will be.
set arChanCfg=Stereo
:: Buffer Milliseconds		-- How much time the sound card is given to process incoming audio. Lower values will have less delay, but will strain your computer more.
set arBufferMs=100
:: Buffers					-- How many buffers are alloted to queue audio for playback. 8-15 should be good, but you want overflow and underflow to be as low as possible.
set arBuffers=10
:: Priority					-- This affects how fast the buffers are filled with new audio to playback. Higher values can freeze your OS if too many things are running.
:: Allowed Values: [ Normal | High | Realtime ] (Others may work, such as AboveNormal etc, but this is what is listed in Audio Repeater.)
set arPriority=High
:: AutoStart				-- Whether Audio Repeater automatically starts repeating audio.
:: Allowed Values: [ true | yes | 1 | y ] (Using values not listed here will have no effect.)
set arAutoStart=true

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: DO NOT EDIT ANYTHING BELOW THESE LINES UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING. ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if %arAutoStart%==1 set arAutoStart=/AutoStart
if /i %arAutoStart%==y set arAutoStart=/AutoStart
if /i %arAutoStart%==true set arAutoStart=/AutoStart
if /i %arAutoStart%==yes set arAutoStart=/AutoStart
if %arAutoStart% neq /AutoStart set arAutoStart=

start /min "%arWindowName%" "%arPath%" /WindowName:"%arWindowName%" /Input:"%arInput%" /Output:"%arOutput%" /SamplingRate:%arSamplingRate% /BitsPerSample:%arBitsPerSample% /Channels:%arChannels% /ChanCfg:"%arChanCfg%" /BufferMs:%arBufferMs% /Buffers:%arBuffers% /Priority:%arPriority% %arAutoStart%