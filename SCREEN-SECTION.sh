SCREEN SECTION
       The config file may have multiple Screen sections.  There must be at
       least one, for the “screen” being used.  A “screen” represents the
       binding of a graphics device (Device section) and a monitor (Monitor
       section).  A Screen section is considered “active” if it is referenced
       by an active ServerLayout section or by the -screen command line
       option.  If neither of those is present, the first Screen section found
       in the config file is considered the active one.

       Screen sections have the following format:

           Section "Screen"
               Identifier "name"
               Device     "devid"
               GPUDevice  "devid"
               Monitor    "monid"
               entries
               ...
               SubSection "Display"
                  entries
                  ...
               EndSubSection
               ...
           EndSection

       The Identifier entry is mandatory.  All others are optional.

       The Identifier entry specifies the unique name for this screen.  The
       Screen section provides information specific to the whole screen,
       including screen-specific Options.  In multi-head configurations, there
       will be multiple active Screen sections, one for each head.  The
       entries available for this section are:

       Device  "device-id"
              This entry specifies the Device section to be used for this
              screen.  When multiple graphics cards are present, this is what
              ties a specific card to a screen.  The device-id must match the
              Identifier of a Device section in the config file.

       GPUDevice  "device-id"
              This entry specifies the Device section to be used as a
              secondary GPU device for this screen.  When multiple graphics
              cards are present, this is what ties a specific secondary card
              to a screen.  The device-id must match the Identifier of a
              Device section in the config file. This can be specified up to 4
              times for a single screen.

       Monitor  "monitor-id"
              specifies which monitor description is to be used for this
              screen.  If a Monitor name is not specified, a default
              configuration is used.  Currently the default configuration may
              not function as expected on all platforms.

       VideoAdaptor  "xv-id"
              specifies an optional Xv video adaptor description to be used
              with this screen.

       DefaultDepth  depth
              specifies which color depth the server should use by default.
              The -depth command line option can be used to override this.  If
              neither is specified, the default depth is driver-specific, but
              in most cases is 8.

       DefaultFbBpp  bpp
              specifies which framebuffer layout to use by default.  The
              -fbbpp command line option can be used to override this.  In
              most cases the driver will chose the best default value for
              this.  The only case where there is even a choice in this value
              is for depth 24, where some hardware supports both a packed 24
              bit framebuffer layout and a sparse 32 bit framebuffer layout.

       MatchSeat  seat-id
              Only apply this Screen section if X server was started with
              -seat seat-id option.

       Options
              Various Option flags may be specified in the Screen section.
              Some are driver-specific and are described in the driver
              documentation.  Others are driver-independent, and will
              eventually be described here.

       Option "Accel"
              Enables 2D hardware acceleration.  This option is on by default,
              but it may be necessary to turn it off if there are bugs in the
              driver.  There are many options to disable specific accelerated
              operations, listed below.  Note that disabling an operation will
              have no effect if the operation is not accelerated (whether due
              to lack of support in the hardware or in the driver).

       Option "GlxVendorLibrary" "string"
              This option specifies a space-separated list of OpenGL vendor
              libraries to use for the screen. This may be used to select an
              alternate implementation for development, debugging, or
              alternate feature sets.  Default: mesa.

       Option "InitPrimary" "boolean"
              Use the Int10 module to initialize the primary graphics card.
              Normally, only secondary cards are soft-booted using the Int10
              module, as the primary card has already been initialized by the
              BIOS at boot time.  Default: false.

       Option "NoInt10" "boolean"
              Disables the Int10 module, a module that uses the int10 call to
              the BIOS of the graphics card to initialize it.  Default: false.

       Each Screen section may optionally contain one or more Display
       subsections.  Those subsections provide depth/fbbpp specific
       configuration information, and the one chosen depends on the depth
       and/or fbbpp that is being used for the screen.  The Display subsection
       format is described in the section below.
