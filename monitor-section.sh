MONITOR SECTION
       The config file may have multiple Monitor sections.  There should
       normally be at least one, for the monitor being used, but a default
       configuration will be created when one isn't specified.

       Monitor sections have the following format:

           Section "Monitor"
               Identifier "name"
               entries
               ...
           EndSection

       The only mandatory entry in a Monitor section is the Identifier entry.

       The Identifier entry specifies the unique name for this monitor.  The
       Monitor section may be used to provide information about the
       specifications of the monitor, monitor-specific Options, and
       information about the video modes to use with the monitor.

       With RandR 1.2-enabled drivers, monitor sections may be tied to
       specific outputs of the video card.  Using the name of the output
       defined by the video driver plus the identifier of a monitor section,
       one associates a monitor section with an output by adding an option to
       the Device section in the following format:

       Option "Monitor-outputname" "monitorsection"

       (for example, Option "Monitor-VGA" "VGA monitor" for a VGA output)

       In the absence of specific association of monitor sections to outputs,
       if a monitor section is present the server will associate it with an
       output to preserve compatibility for previous single-head
       configurations.

       Specifying video modes is optional because the server will use the DDC
       or other information provided by the monitor to automatically configure
       the list of modes available.  When modes are specified explicitly in
       the Monitor section (with the Mode, ModeLine, or UseModes keywords),
       built-in modes with the same names are not included.  Built-in modes
       with different names are, however, still implicitly included, when they
       meet the requirements of the monitor.

       The entries that may be used in Monitor sections are described below.

       VendorName  "vendor"
              This optional entry specifies the monitor's manufacturer.

       ModelName  "model"
              This optional entry specifies the monitor's model.

       HorizSync  horizsync-range
              gives the range(s) of horizontal sync frequencies supported by
              the monitor.  horizsync-range may be a comma separated list of
              either discrete values or ranges of values.  A range of values
              is two values separated by a dash.  By default the values are in
              units of kHz.  They may be specified in MHz or Hz if MHz or Hz
              is added to the end of the line.  The data given here is used by
              the Xorg server to determine if video modes are within the
              specifications of the monitor.  This information should be
              available in the monitor's handbook.  If this entry is omitted,
              a default range of 28-33kHz is used.

       VertRefresh  vertrefresh-range
              gives the range(s) of vertical refresh frequencies supported by
              the monitor.  vertrefresh-range may be a comma separated list of
              either discrete values or ranges of values.  A range of values
              is two values separated by a dash.  By default the values are in
              units of Hz.  They may be specified in MHz or kHz if MHz or kHz
              is added to the end of the line.  The data given here is used by
              the Xorg server to determine if video modes are within the
              specifications of the monitor.  This information should be
              available in the monitor's handbook.  If this entry is omitted,
              a default range of 43-72Hz is used.

       DisplaySize  width height
              This optional entry gives the width and height, in millimetres,
              of the picture area of the monitor.  If given this is used to
              calculate the horizontal and vertical pitch (DPI) of the screen.

       Gamma  gamma-value

       Gamma  red-gamma green-gamma blue-gamma
              This is an optional entry that can be used to specify the gamma
              correction for the monitor.  It may be specified as either a
              single value or as three separate RGB values.  The values should
              be in the range 0.1 to 10.0, and the default is 1.0.  Not all
              drivers are capable of using this information.

       UseModes  "modesection-id"
              Include the set of modes listed in the Modes section called
              modesection-id.  This makes all of the modes defined in that
              section available for use by this monitor.

       Mode  "name"
              This is an optional multi-line entry that can be used to provide
              definitions for video modes for the monitor.  In most cases this
              isn't necessary because the built-in set of VESA standard modes
              will be sufficient.  The Mode keyword indicates the start of a
              multi-line video mode description.  The mode description is
              terminated with the EndMode keyword.  The mode description
              consists of the following entries:

              DotClock  clock
                  is the dot (pixel) clock rate to be used for the mode.

              HTimings  hdisp hsyncstart hsyncend htotal
                  specifies the horizontal timings for the mode.

              VTimings  vdisp vsyncstart vsyncend vtotal
                  specifies the vertical timings for the mode.

              Flags  "flag" ...
                  specifies an optional set of mode flags, each of which is a
                  separate string in double quotes.  "Interlace" indicates
                  that the mode is interlaced.  "DoubleScan" indicates a mode
                  where each scanline is doubled.  "+HSync" and "-HSync" can
                  be used to select the polarity of the HSync signal.
                  "+VSync" and "-VSync" can be used to select the polarity of
                  the VSync signal.  "Composite" can be used to specify
                  composite sync on hardware where this is supported.
                  Additionally, on some hardware, "+CSync" and "-CSync" may be
                  used to select the composite sync polarity.

              HSkew  hskew
                  specifies the number of pixels (towards the right edge of
                  the screen) by which the display enable signal is to be
                  skewed.  Not all drivers use this information.  This option
                  might become necessary to override the default value
                  supplied by the server (if any).  “Roving” horizontal lines
                  indicate this value needs to be increased.  If the last few
                  pixels on a scan line appear on the left of the screen, this
                  value should be decreased.

              VScan  vscan
                  specifies the number of times each scanline is painted on
                  the screen.  Not all drivers use this information.  Values
                  less than 1 are treated as 1, which is the default.
                  Generally, the "DoubleScan" Flag mentioned above doubles
                  this value.

       ModeLine  "name" mode-description
              This entry is a more compact version of the Mode entry, and it
              also can be used to specify video modes for the monitor.  This
              is a single line format for specifying video modes.  In most
              cases this isn't necessary because the built-in set of VESA
              standard modes will be sufficient.

              The mode-description is in four sections, the first three of
              which are mandatory.  The first is the dot (pixel) clock.  This
              is a single number specifying the pixel clock rate for the mode
              in MHz.  The second section is a list of four numbers specifying
              the horizontal timings.  These numbers are the hdisp,
              hsyncstart, hsyncend, and htotal values.  The third section is a
              list of four numbers specifying the vertical timings.  These
              numbers are the vdisp, vsyncstart, vsyncend, and vtotal values.
              The final section is a list of flags specifying other
              characteristics of the mode.  Interlace indicates that the mode
              is interlaced.  DoubleScan indicates a mode where each scanline
              is doubled.  +HSync and -HSync can be used to select the
              polarity of the HSync signal.  +VSync and -VSync can be used to
              select the polarity of the VSync signal.  Composite can be used
              to specify composite sync on hardware where this is supported.
              Additionally, on some hardware, +CSync and -CSync may be used to
              select the composite sync polarity.  The HSkew and VScan options
              mentioned above in the Mode entry description can also be used
              here.

       Option "DPMS" "bool"
              This option controls whether the server should enable the DPMS
              extension for power management for this screen.  The default is
              to enable the extension.

       Option "SyncOnGreen" "bool"
              This option controls whether the video card should drive the
              sync signal on the green color pin.  Not all cards support this
              option, and most monitors do not require it.  The default is
              off.

       Option "Primary" "bool"
              This optional entry specifies that the monitor should be treated
              as the primary monitor. (RandR 1.2-supporting drivers only)

       Option "PreferredMode" "name"
              This optional entry specifies a mode to be marked as the
              preferred initial mode of the monitor.  (RandR 1.2-supporting
              drivers only)

       Option "ZoomModes" "name name ..."
              This optional entry specifies modes to be marked as zoom modes.
              It is possible to switch to the next and previous mode via
              Ctrl+Alt+Keypad-Plus and Ctrl+Alt+Keypad-Minus.  All these
              keypad available modes are selected from the screen mode list.
              This list is a copy of the compatibility output monitor mode
              list.  Since this output is the output connected to the lowest
              dot-area monitor, as determined from its largest size mode, that
              monitor defines the available zoom modes.  (RandR 1.2-supporting
              drivers only)

       Option "Position" "x y"
              This optional entry specifies the position of the monitor within
              the X screen.  (RandR 1.2-supporting drivers only)

       Option "LeftOf" "output"
              This optional entry specifies that the monitor should be
              positioned to the left of the output (not monitor) of the given
              name.  (RandR 1.2-supporting drivers only)

       Option "RightOf" "output"
              This optional entry specifies that the monitor should be
              positioned to the right of the output (not monitor) of the given
              name.  (RandR 1.2-supporting drivers only)

       Option "Above" "output"
              This optional entry specifies that the monitor should be
              positioned above the output (not monitor) of the given name.
              (RandR 1.2-supporting drivers only)

       Option "Below" "output"
              This optional entry specifies that the monitor should be
              positioned below the output (not monitor) of the given name.
              (RandR 1.2-supporting drivers only)

       Option "Enable" "bool"
              This optional entry specifies whether the monitor should be
              turned on at startup.  By default, the server will attempt to
              enable all connected monitors.  (RandR 1.2-supporting drivers
              only)

       Option "DefaultModes" "bool"
              This optional entry specifies whether the server should add
              supported default modes to the list of modes offered on this
              monitor. By default, the server will add default modes; you
              should only disable this if you can guarantee that EDID will be
              available at all times, or if you have added custom modelines
              which the server can use.  (RandR 1.2-supporting drivers only)

       Option "MinClock" "frequency"
              This optional entry specifies the minimum dot clock, in kHz,
              that is supported by the monitor.

       Option "MaxClock" "frequency"
              This optional entry specifies the maximum dot clock, in kHz,
              that is supported by the monitor.

       Option "Ignore" "bool"
              This optional entry specifies that the monitor should be ignored
              entirely, and not reported through RandR.  This is useful if the
              hardware reports the presence of outputs that don't exist.
              (RandR 1.2-supporting drivers only)

       Option "Rotate" "rotation"
              This optional entry specifies the initial rotation of the given
              monitor.  Valid values for rotation are "normal", "left",
              "right", and "inverted".  (RandR 1.2-supporting drivers only)
