TEMPLATE = app

SOURCES += main.cpp

webassembly.target = webassembly
#webassembly.commands = cmd /c echo This is a test > C:\\Users\\gsylv\\OneDrive\\Documents\\build-project-Desktop_Qt_6_6_0_MinGW_64_bit-Debug\\webassembly\\debug\\test.txt
#webassembly.commands = cd C:\Users\gsylv\source\repos\build-project-Desktop_Qt_6_6_0_MinGW_64_bit-Debug\webassembly\ && C:/Qt/6.6.0/wasm_singlethread/bin/qmake.bat -o Makefile $$PWD/webassembly/webassembly.pro -qtconf C:/Qt/6.6.0/wasm_singlethread/bin/target_qt.conf -spec wasm-emscripten && C:\Users\gsylv\emsdk\upstream\emscripten\emmake make -f Makefile
webassembly.commands = \
    set PATH=C:\Users\gsylv\emsdk\upstream\emscripten;%PATH% && \
    cd $$OUT_PWD\webassembly\ && \
    $$(QTDIR)/../wasm_singlethread/bin/qmake.bat -o Makefile $$PWD/webassembly/webassembly.pro -qtconf $$(QTDIR)/../wasm_singlethread/bin/target_qt.conf -spec wasm-emscripten && \
    emmake make -f Makefile


# Depend on a pseudo-target to always run
webassembly.depends = FORCE

# Add the custom target to the build process
QMAKE_EXTRA_TARGETS += webassembly
# Ensure the custom command is executed before the main build
PRE_TARGETDEPS += webassembly

# This renames the resulting executable
TARGET = project
