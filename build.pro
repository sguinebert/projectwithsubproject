TEMPLATE = app

SOURCES += main.cpp

webassembly.target = webassembly
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

#all dependencies
unix|win32: LIBS += -L$$PWD/../../../../../../msys64/mingw64/lib/ -lncurses
INCLUDEPATH += $$PWD/../../../../../../msys64/mingw64/include
DEPENDPATH += $$PWD/../../../../../../msys64/mingw64/include
