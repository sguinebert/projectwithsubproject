TEMPLATE = subdirs  # This changes to the subdirs function.  You can't combine
                    # compiling code and the subdirs function in the same .pro
                    # file.

# By default, you assign a directory to the SUBDIRS variable, and qmake looks
# inside that directory for a <dirname>.pro file.
#$$(INCLUDE_WEBASSEMBLY):SUBDIRS += webassembly

contains(QMAKE_CXX, em\+\+)|contains(QMAKE_LINK, em\+\+): {
    message("Compiling with WebAssembly kit")
    SUBDIRS += webassembly
}

## Define the target for the subproject
#webassembly.target = webassembly
#webassembly.commands = cmd /c echo This is a test > C:\\Users\\gsylv\\OneDrive\\Documents\\build-project-Desktop_Qt_6_6_0_MinGW_64_bit-Debug\\webassembly\\debug\\test.txt
##webassembly.commands = $$[QT_BIN_PATH]/qmake webassembly.pro -spec wasm-emscripten && make -j4
## Depend on a pseudo-target to always run
#webassembly.depends = FORCE

# Add the custom target to the build process
QMAKE_EXTRA_TARGETS += webassembly
# Ensure the custom command is executed before the main build
PRE_TARGETDEPS += webassembly

# You can append as many items as desired.  You can also specify the .pro file
# directly if need be.
#SUBDIRS += gui/gui.pro

# You can also create a target that isn't a subdirectory, or that refers to a
# different file(*).
SUBDIRS += build
build.file = build.pro # This specifies the .pro file to use
# You can also use this to specify dependencies.  In this case, we don't want
# the build target to run until after the logic and gui targets are complete.
#build.depends = webassembly

CONFIG += ordered
