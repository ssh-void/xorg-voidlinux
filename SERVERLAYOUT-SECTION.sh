SERVERLAYOUT SECTION
       The config file may have multiple ServerLayout sections.  A “server
       layout” represents the binding of one or more screens (Screen sections)
       and one or more input devices (InputDevice sections) to form a complete
       configuration.  In multi-head configurations, it also specifies the
       relative layout of the heads.  A ServerLayout section is considered
       “active” if it is referenced by the -layout command line option or by
       an Option "DefaultServerLayout" entry in the ServerFlags section (the
       former takes precedence over the latter).  If those options are not
       used, the first ServerLayout section found in the config file is
       considered the active one.  If no ServerLayout sections are present,
       the single active screen and two active (core) input devices are
       selected as described in the relevant sections above.

       ServerLayout sections have the following format:

           Section "ServerLayout"
               Identifier   "name"
               Screen       "screen-id"
               ...
               InputDevice  "idev-id"
               ...
               options
               ...
           EndSection

       Each ServerLayout section must have an Identifier entry and at least
       one Screen entry.

       The Identifier entry specifies the unique name for this server layout.
       The ServerLayout section provides information specific to the whole
       session, including session-specific Options.  The ServerFlags options
       (described above) may be specified here, and ones given here override
       those given in the ServerFlags section.

       The entries that may be used in this section are described here.

       Screen  screen-num "screen-id" position-information
              One of these entries must be given for each screen being used in
              a session.  The screen-id field is mandatory, and specifies the
              Screen section being referenced.  The screen-num field is
              optional, and may be used to specify the screen number in
              multi-head configurations.  When this field is omitted, the
              screens will be numbered in the order that they are listed in.
              The numbering starts from 0, and must be consecutive.  The
              position-information field describes the way multiple screens
              are positioned.  There are a number of different ways that this
              information can be provided:

              x y

              Absolute  x y
                  These both specify that the upper left corner's coordinates
                  are (x,y).  The Absolute keyword is optional.  Some older
                  versions of XFree86 (4.2 and earlier) don't recognise the
                  Absolute keyword, so it's safest to just specify the
                  coordinates without it.

              RightOf   "screen-id"

              LeftOf    "screen-id"

              Above     "screen-id"

              Below     "screen-id"

              Relative  "screen-id" x y
                  These give the screen's location relative to another screen.
                  The first four position the screen immediately to the right,
                  left, above or below the other screen.  When positioning to
                  the right or left, the top edges are aligned.  When
                  positioning above or below, the left edges are aligned.  The
                  Relative form specifies the offset of the screen's origin
                  (upper left corner) relative to the origin of another
                  screen.

       InputDevice  "idev-id" "option" ...
              One of these entries should be given for each input device being
              used in a session.  Normally at least two are required, one each
              for the core pointer and keyboard devices.  If either of those
              is missing, suitable InputDevice entries are searched for using
              the method described above in the INPUTDEVICE section.  The
              idev-id field is mandatory, and specifies the name of the
              InputDevice section being referenced.  Multiple option fields
              may be specified, each in double quotes.  The options permitted
              here are any that may also be given in the InputDevice sections.
              Normally only session-specific input device options would be
              used here.  The most commonly used options are:

                  "CorePointer"
                  "CoreKeyboard"
                  "SendCoreEvents"

              and the first two should normally be used to indicate the core
              pointer and core keyboard devices respectively.

       MatchSeat  seat-id
              Only apply this ServerLayout section if X server was started
              with -seat seat-id option.

       Options
              In addition to the following, any option permitted in the
              ServerFlags section may also be specified here.  When the same
              option appears in both places, the value given here overrides
              the one given in the ServerFlags section.

       Option "IsolateDevice"  "bus-id"
              Restrict device resets to the specified bus-id.  See the BusID
              option (described in DEVICE SECTION, above) for the format of
              the bus-id parameter.  This option overrides SingleCard, if
              specified.  At present, only PCI devices can be isolated in this
              manner.

       Option "SingleCard"  "boolean"
              As IsolateDevice, except that the bus ID of the first device in
              the layout is used.

       Here is an example of a ServerLayout section for a dual headed
       configuration with two mice:

           Section "ServerLayout"
               Identifier  "Layout 1"
               Screen      "MGA 1"
               Screen      "MGA 2" RightOf "MGA 1"
               InputDevice "Keyboard 1" "CoreKeyboard"
               InputDevice "Mouse 1"    "CorePointer"
               InputDevice "Mouse 2"    "SendCoreEvents"
               Option      "BlankTime"  "5"
           EndSection
