! include( ../common.pri ) {
    error( "Couldn't find the common.pri file!" )
}

# Custom target for test command
#test_command.target = testfile
#test_command.commands = cmd /c echo This is a test > $$PWD/test.txt
#test_command.depends = FORCE

#QMAKE_EXTRA_TARGETS += test_command
#PRE_TARGETDEPS += testfile

#webassembly.target = webassembly
##webassembly.commands = cmd /c echo This is a test > C:\\Users\\gsylv\\OneDrive\\Documents\\build-project-Desktop_Qt_6_6_0_MinGW_64_bit-Debug\\webassembly\\debug\\test.txt
##webassembly.commands = cd C:\Users\gsylv\source\repos\build-project-Desktop_Qt_6_6_0_MinGW_64_bit-Debug\webassembly\ && C:/Qt/6.6.0/wasm_singlethread/bin/qmake.bat -o Makefile $$PWD/webassembly/webassembly.pro -qtconf C:/Qt/6.6.0/wasm_singlethread/bin/target_qt.conf -spec wasm-emscripten && C:\Users\gsylv\emsdk\upstream\emscripten\emmake make -f Makefile
#webassembly.commands = \
#    set PATH=C:\Users\gsylv\emsdk\upstream\emscripten;%PATH% && \
#    cd C:\Users\gsylv\source\repos\build-project-Desktop_Qt_6_6_0_MinGW_64_bit-Debug\webassembly\ && \
#    C:/Qt/6.6.0/wasm_singlethread/bin/qmake.bat -o Makefile $$PWD/webassembly.pro -qtconf C:/Qt/6.6.0/wasm_singlethread/bin/target_qt.conf -spec wasm-emscripten && \
#    C:\Users\gsylv\emsdk\upstream\emscripten\emmake make -f Makefile


## Depend on a pseudo-target to always run
#webassembly.depends = FORCE

## Add the custom target to the build process
#QMAKE_EXTRA_TARGETS += webassembly
## Ensure the custom command is executed before the main build
#PRE_TARGETDEPS += webassembly

SOURCES += main.cpp

# By default, TARGET is the same as the directory, so it will make 
# libgui.so (in linux).  Uncomment to override.
# TARGET = target
