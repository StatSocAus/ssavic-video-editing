# Video editing resources from SSA Vic

Automating simple editing of video recordings.

The script provided here (`trim.20200721.sh`) is an example of one we have used
at SSA Vic.  It does the following:

1. Trims off the start and end of a recording, by a user-specified amount.
2. Creates a standardised video and audio version, with consistent metadata.
3. Reduces file sizes to a sensible level.

You can use it as a template for new recordings.  Simply update the values of
the variables at the top.

The script was written by Damjan Vukcevic and run on an Ubuntu installation.
It might also work on Windows and MacOS, but it will likely require installing
special packages and has not yet been tested on those operating systems.


## Variables

The following variables set various metadata in the output files:

* `TITLE`
* `ARTIST`
* `ALBUM`

The following variable is used to conveniently set a standardised format for
the output filenames (so that, by default, the `OUTPUT` variable doesn't ever
need to be altered):

* `TAG`

The following variables define where to trim the recording:

* `START_TIME`
* `DURATION` (this is the desired duration for the **output** files)

The following variables define input and output files:

* `INPUT`: a filename
* `OUTPUT`: a **prefix** for the output filenames


## Output

The script will produce two files: a video recording (in MP4 format) and an
audio recording (in MP3 format).


## Tips

If the input video file is very large (which was the case in the past when we
used recordings from the Lecture Capture system at the University of
Melbourne), then use the `-b 100k` setting when transcoding the video.  This
will create a much smaller video output file.

If you like to keep your recordings in subdirectories, you can change the
`INPUT` and `OUTPUT` variables to some standard values.  For example, here's
what we have usually used within SSA Vic:

    INPUT=raw/zoom_1.mp4
    OUTPUT=output/ssavic_$TAG


## Licence

See the [LICENSE](LICENSE.txt) file for license rights and limitations (MIT).
