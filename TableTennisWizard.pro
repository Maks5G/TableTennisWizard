TEMPLATE = app

QT += quick qml

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        fileio.cpp \
        main.cpp

RESOURCES += qml.qrc

TRANSLATIONS = translator/ukrainian.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ui/MidArea/RulesArea/RulesArea.qml \
    ui/MidArea/ServeArea/ServeArea.qml \
    ui/MidArea/ServeArea/ServeAssets/side spin.gif \
    ui/MidArea/StandartsArea/StandartsArea.qml \
    ui/MidArea/StartScreen/StartScreen.qml \
    ui/assets/licensing.png \
    ui/assets/moon.png \
    ui/assets/rules.png \
    ui/assets/serve.png

HEADERS += \
    fileio.h \
    mylang.h \
    mytranslator.h
