
DISPLAY SUBSECTION
       Each Screen section may have multiple Display subsections.  The
       “active” Display subsection is the first that matches the depth and/or
       fbbpp values being used, or failing that, the first that has neither a
       depth or fbbpp value specified.  The Display subsections are optional.
       When there isn't one that matches the depth and/or fbbpp values being
       used, all the parameters that can be specified here fall back to their
       defaults.

       Display subsections have the following format:

               SubSection "Display"
                   Depth  depth
                   entries
                   ...
               EndSubSection

       Depth  depth
              This entry specifies what colour depth the Display subsection is
              to be used for.  This entry is usually specified, but it may be
              omitted to create a match-all Display subsection or when wishing
              to match only against the FbBpp parameter.  The range of depth
              values that are allowed depends on the driver.  Most drivers
              support 8, 15, 16 and 24.  Some also support 1 and/or 4, and
              some may support other values (like 30).  Note: depth means the
              number of bits in a pixel that are actually used to determine
              the pixel colour.  32 is not a valid depth value.  Most hardware
              that uses 32 bits per pixel only uses 24 of them to hold the
              colour information, which means that the colour depth is 24, not
              32.

       FbBpp  bpp
              This entry specifies the framebuffer format this Display
              subsection is to be used for.  This entry is only needed when
              providing depth 24 configurations that allow a choice between a
              24 bpp packed framebuffer format and a 32bpp sparse framebuffer
              format.  In most cases this entry should not be used.

       Weight  red-weight green-weight blue-weight
              This optional entry specifies the relative RGB weighting to be
              used for a screen is being used at depth 16 for drivers that
              allow multiple formats.  This may also be specified from the
              command line with the -weight option (see Xorg(1)).

       Virtual  xdim ydim
              This optional entry specifies the virtual screen resolution to
              be used.  xdim must be a multiple of either 8 or 16 for most
              drivers, and a multiple of 32 when running in monochrome mode.
              The given value will be rounded down if this is not the case.
              Video modes which are too large for the specified virtual size
              will be rejected.  If this entry is not present, the virtual
              screen resolution will be set to accommodate all the valid video
              modes given in the Modes entry.  Some drivers/hardware
              combinations do not support virtual screens.  Refer to the
              appropriate driver-specific documentation for details.

       ViewPort  x0 y0
              This optional entry sets the upper left corner of the initial
              display.  This is only relevant when the virtual screen
              resolution is different from the resolution of the initial video
              mode.  If this entry is not given, then the initial display will
              be centered in the virtual display area.

       Modes  "mode-name" ...
              This optional entry specifies the list of video modes to use.
              Each mode-name specified must be in double quotes.  They must
              correspond to those specified or referenced in the appropriate
              Monitor section (including implicitly referenced built-in VESA
              standard modes).  The server will delete modes from this list
              which don't satisfy various requirements.  The first valid mode
              in this list will be the default display mode for startup.  The
              list of valid modes is converted internally into a circular
              list.  It is possible to switch to the next mode with
              Ctrl+Alt+Keypad-Plus and to the previous mode with
              Ctrl+Alt+Keypad-Minus.  When this entry is omitted, the valid
              modes referenced by the appropriate Monitor section will be
              used.  If the Monitor section contains no modes, then the
              selection will be taken from the built-in VESA standard modes.

       Visual  "visual-name"
              This optional entry sets the default root visual type.  This may
              also be specified from the command line (see the Xserver(1) man
              page).  The visual types available for depth 8 are (default is
              PseudoColor):

                  StaticGray
                  GrayScale
                  StaticColor
                  PseudoColor
                  TrueColor
                  DirectColor

              The visual type available for the depths 15, 16 and 24 are
              (default is TrueColor):

                  TrueColor
                  DirectColor

              Not all drivers support DirectColor at these depths.

              The visual types available for the depth 4 are (default is
              StaticColor):

                  StaticGray
                  GrayScale
                  StaticColor
                  PseudoColor

              The visual type available for the depth 1 (monochrome) is
              StaticGray.

       Black  red green blue
              This optional entry allows the “black” colour to be specified.
              This is only supported at depth 1.  The default is black.

       White  red green blue
              This optional entry allows the “white” colour to be specified.
              This is only supported at depth 1.  The default is white.

       Options
              Option flags may be specified in the Display subsections.  These
              may include driver-specific options and driver-independent
              options.  The former are described in the driver-specific
              documentation.  Some of the latter are described above in the
              section about the Screen section, and they may also be included
              here.
